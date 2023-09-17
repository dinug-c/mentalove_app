import 'package:flutter/material.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/pages/content.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class DailyContentPage extends StatefulWidget {
  const DailyContentPage({super.key});

  @override
  State<DailyContentPage> createState() => _DailyContentPageState();
}

class _DailyContentPageState extends State<DailyContentPage> {
  final _future =
      supabase.from('daily_content').select<List<Map<String, dynamic>>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(slivers: <Widget>[
        AppBarCustom(
          title: 'Daily Content',
          startColor: kPrimaryColor,
          endColor: kPrimary2Color,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cek Artikel Terbaru!!!',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: extraBold),
                    ),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('Tidak ada yang tersedia'));
                        }
                        final contents = snapshot.data!;
                        return MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.55,
                            ),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: contents.length,
                            itemBuilder: ((context, index) {
                              final content = contents[index];
                              return DailyCard(
                                imgUrl: content['thumbnail_url'],
                                title: content['judul'],
                                desc: content['deskripsi'],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ContentPage(konten: content),
                                    ),
                                  );
                                },
                              );
                              // return Padding(
                              //   padding: index == 0
                              //       ? const EdgeInsets.only(
                              //           left: 0.0, right: 3.5)
                              //       : const EdgeInsets.symmetric(
                              //           horizontal: 3.5),
                              //   child: Wrap(children: [
                              //     DailyCard(
                              //       imgUrl: 'content',
                              //       title: 'asaasaasaasaasa',
                              //       desc:
                              //           'Constellation of Stars Constellation of StarsConstellation of Stars',
                              //       onTap: () {},
                              //     ),
                              //   ]),
                              // );
                            }),
                          ),
                        );
                      },
                    ),
                  ]))
        ]))
      ]),
    );
  }
}
