import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/providers/last_read_surah_provider.dart';
import 'package:quran_app/ui/screens/surah_screen/surah_screen.dart';
import 'package:quran_app/utils/app_style.dart';

class LastReadSurahWidget extends StatefulWidget {
  const LastReadSurahWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LastReadSurahWidget> createState() => _LastReadSurahWidgetState();
}

class _LastReadSurahWidgetState extends State<LastReadSurahWidget> {
  @override
  void initState() {
    super.initState();
    context.read<LastReadSurahProvider>().getLastReadSurah();
  }

  @override
  Widget build(BuildContext context) {
    Surah? surah = context.watch<LastReadSurahProvider>().surah;

    // last reading widget
    return InkWell(
      onTap: () => surah == null
          ? null
          : Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => SurahScreen(surah: surah))),
            ),
      child: Container(
        //style
        padding: const EdgeInsets.all(AppStyle.paddin),
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 15,
                spreadRadius: -5,
                color: AppStyle.secondaryColor)
          ],
          gradient: const LinearGradient(
            colors: [
              AppStyle.primaryColor,
              AppStyle.secondaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        //
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/quran.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                surah == null
                    ? Container()
                    : Text('أخر ما قرأت',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.7))),
                const SizedBox(height: 15),
                surah == null
                    ? const SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 1.8,
                          color: Color(0x9CEAEAEA),
                        ),
                      )
                    : Text(surah.name,
                        style: AppStyle.titleTextStyle
                            .copyWith(color: AppStyle.whiteColor)),
                surah == null ? const SizedBox(height: 15) : const SizedBox(),
                surah == null
                    ? const SizedBox(
                        width: 130,
                        child: Divider(
                          thickness: 1.8,
                          color: Color(0x9CEAEAEA),
                        ),
                      )
                    : Text(surah.enName,
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.7)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
