import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';

import '../../main.dart';
import '../shared/gaps.dart';
import '../shared/theme.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class AddStatus extends StatefulWidget {
  const AddStatus({super.key});

  @override
  State<AddStatus> createState() => _AddStatusState();
}

class _AddStatusState extends State<AddStatus> {
  TextEditingController namaController = TextEditingController();
  TextEditingController kontenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarCustom(
            title: 'Tambah Status',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                gapH12,
                NewForm(
                    nama: "Nama",
                    hintText: "Masukkan nama/anonim",
                    controller: namaController,
                    obscureText: false,
                    horizontalPadding: 25),
                gapH8,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Konten",
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                maxLines: 8,
                                controller: kontenController,
                                decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffB46BE9)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    hintText: 'Apa yang kamu pikirkan?',
                                    hintStyle: blackTextStyle.copyWith(
                                        color: Colors.grey)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Button(
                              text: "Posting",
                              textColor: kWhiteColor,
                              startColor: kPrimaryColor,
                              endColor: kPrimary2Color,
                              onPressed: () async {
                                try {
                                  await supabase.from('tell_us').insert({
                                    'pengirim': namaController.text.toString(),
                                    'konten': kontenController.text.toString(),
                                    'tanggal': getFormattedDate()
                                  });
                                  showToast(context, "Status berhasil dikirim");
                                  Navigator.pushNamed(context, '/main-page');
                                } catch (e) {
                                  showToast(context, e.toString());
                                }
                              }),
                        )
                      ]),
                ),
                gapH8,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
