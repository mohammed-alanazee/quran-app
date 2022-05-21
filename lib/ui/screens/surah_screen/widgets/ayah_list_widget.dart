import 'package:flutter/material.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/services/quran_api.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/ayah_item_widget.dart';
import 'package:quran_app/ui/common/loding_listview.dart';

class AyahListWidget extends StatefulWidget {
  final int number;
  const AyahListWidget({Key? key, required this.number}) : super(key: key);

  @override
  State<AyahListWidget> createState() => _AyahListWidgetState();
}

class _AyahListWidgetState extends State<AyahListWidget> {
  List<Ayah> markedAyahList = [];
  @override
  void initState() {
    super.initState();
    //  BookMarkStorage().getAllBookMarked(ayahNumber:).then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ayah>>(
      future: QuranApi().fetchAyahBySuarh(widget.number),
      builder: (BuildContext context, AsyncSnapshot<List<Ayah>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return AyahItemWidget(
                  ayah: snapshot.data![index], surahNumber: widget.number);
            },
            shrinkWrap: true,
          );
        } else if (snapshot.hasError) {
          Future(() => showDialog(
              context: context,
              useRootNavigator: true,
              builder: (ctx) => AlertDialog(
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.error_outline_rounded,
                              color: Colors.red, size: 50),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'حدث خطأ',
                          )
                        ]),
                    content: const Text(
                      '!الرجاء التأكد من اتصال الأنترنت',
                      textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'إعادة الأتصال',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ],
                  )));
          return const LodingListView();
        }
        return const LodingListView();
      },
    );
  }
}
