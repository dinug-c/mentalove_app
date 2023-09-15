// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:mentalove_app/controllers/storage_controller.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';

import '../../main.dart';
import '../../model/message_model.dart';
import '../../model/profile_model.dart';
import '../shared/theme.dart';

class ChatPsikologPage extends StatefulWidget {
  final String psikologId;
  final String userId;
  final String kodeUnik;
  const ChatPsikologPage({
    Key? key,
    required this.psikologId,
    required this.userId,
    required this.kodeUnik,
  }) : super(key: key);

  @override
  State<ChatPsikologPage> createState() => _ChatPsikologPageState();
}

class _ChatPsikologPageState extends State<ChatPsikologPage> {
  late final Stream<List<Message>> _messagesStream;
  final CountdownController _controller = CountdownController(autoStart: true);
  final Map<String, Profile> _profileCache = {};

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Peringatan!'),
            content: new Text(
                'Apakah kamu yakin ingin mengakhiri sesi konseling ini?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  await supabase.from('order').update({'is_finished': true}).eq(
                      'kode_unik', widget.kodeUnik);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/history-order', (route) => false);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    final myUserId = supabase.auth.currentUser!.id;
    _messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('msg_identifier', "${widget.userId}${widget.psikologId}")
        .order('created_at')
        .map((maps) => maps
            .map((map) => Message.fromMap(map: map, myUserId: myUserId))
            .toList());

    super.initState();
  }

  Future<void> _loadProfileCache(String profileId) async {
    if (_profileCache[profileId] != null) {
      return;
    }
    final data =
        await supabase.from('profiles').select().eq('id', profileId).single();
    final profile = Profile.fromMap(data);
    setState(() {
      _profileCache[profileId] = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: StreamBuilder<List<Message>>(
          stream: _messagesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final messages = snapshot.data!;
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: kPrimaryColor,
                    child: Center(
                      child: Countdown(
                        controller: _controller,
                        seconds: 3600,
                        build: (_, double time) {
                          final int minutes = (time / 60).floor();
                          final int seconds = (time % 60).floor();
                          return Text(
                            '$minutes:${seconds.toString().padLeft(2, '0')}',
                            style: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: bold),
                          );
                        },
                        interval: Duration(milliseconds: 100),
                        onFinished: () {
                          showToast(context, "Waktu konseling telah habis");
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: messages.isEmpty
                        ? const Center(
                            child: Text('Mulai perjalanan konseling kamu :D'),
                          )
                        : ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message = messages[index];

                              _loadProfileCache(message.profileId);

                              return _ChatBubble(
                                message: message,
                                profile: _profileCache[message.profileId],
                              );
                            },
                          ),
                  ),
                  _MessageBar(
                    psikologId: widget.psikologId,
                    userId: widget.userId,
                  ),
                ],
              );
            } else {
              return preloader;
            }
          },
        ),
      ),
    );
  }
}

class _MessageBar extends StatefulWidget {
  final String psikologId;
  final String userId;
  const _MessageBar({
    Key? key,
    required this.psikologId,
    required this.userId,
  }) : super(key: key);

  @override
  State<_MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<_MessageBar> {
  late final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  autofocus: true,
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _submitMessage(),
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final text = _textController.text;
    final myUserId = supabase.auth.currentUser!.id;
    if (text.isEmpty) {
      return;
    }
    _textController.clear();
    try {
      await supabase.from('messages').insert({
        'profile_id': myUserId,
        'content': text,
        'msg_identifier': "${widget.userId}${widget.psikologId}"
      });
    } on PostgrestException catch (error) {
      showToast(context, error.message);
    } catch (_) {
      showToast(context, 'Failed to send message');
    }
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    Key? key,
    required this.message,
    required this.profile,
  }) : super(key: key);

  final Message message;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    List<Widget> chatContents = [
      if (!message.isMine)
        CircleAvatar(
          child: profile == null
              ? preloader
              : Text(profile!.username.substring(0, 2)),
        ),
      const SizedBox(width: 12),
      Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: message.isMine
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message.content),
        ),
      ),
      const SizedBox(width: 12),
      Text(format(message.createdAt, locale: 'en_short')),
      const SizedBox(width: 60),
    ];
    if (message.isMine) {
      chatContents = chatContents.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment:
            message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}
