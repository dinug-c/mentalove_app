import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/pages/detail.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatefulWidget {
  final Map<String, dynamic> konten;
  const ContentPage({super.key, required this.konten});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    final konten = widget.konten;

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(konten['web_url']));
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            konten['judul'],
            style: whiteTextStyle.copyWith(fontWeight: bold),
          ),
          backgroundColor: kPurpleColor,
        ),
        body: WebViewWidget(controller: controller)
        // CustomScrollView(slivers: <Widget>[
        //   AppBarCustom(
        //     title: konten['judul'],
        //     startColor: kPrimaryColor,
        //     endColor: kPrimary2Color,
        //     leftIcon: Icons.arrow_back,
        //     leftAction: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   SliverList(
        //       delegate: SliverChildListDelegate([
        //     Container(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width,
        //         child: )
        //     // Container(
        //     //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //     //     child: Column(
        //     //         crossAxisAlignment: CrossAxisAlignment.start,
        //     //         children: [
        //     //           Text(
        //     //             'Cek Artikel Terbaru!!!',
        //     //             style: blackTextStyle.copyWith(
        //     //                 fontSize: 20, fontWeight: extraBold),
        //     //           ),
        //     //         ]))
        //   ]))
        // ]),
        );
  }
}
