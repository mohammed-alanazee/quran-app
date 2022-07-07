import 'package:provider/provider.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/providers/last_read_surah_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/ui/screens/surah_screen/surah_screen.dart';
import 'package:quran_app/utils/app_style.dart';

import 'package:flutter/material.dart';

class SurahItemWidget extends StatefulWidget {
  final Surah surah;
  const SurahItemWidget({Key? key, required this.surah}) : super(key: key);

  @override
  State<SurahItemWidget> createState() => _SurahItemWidgetState();
}

class _SurahItemWidgetState extends State<SurahItemWidget> {
  @override
  Widget build(BuildContext context) {
    Surah surah = widget.surah;
    var themeProv = context.watch<ThemeProvider>().isDark;
    return InkWell(
      onTap: () async {
        context.read<LastReadSurahProvider>().updateLastReadSurah(surah);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => SurahScreen(surah: surah)),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
          height: 75,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: themeProv ? AppStyle.darkColor2 : AppStyle.whiteColor,
            boxShadow: AppStyle.shadow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(children: [
              // surah number widget
              Container(
                width: 30,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppStyle.secondaryColor),
                child: Center(
                    child: Text(
                  '${surah.number}',
                  style:
                      const TextStyle(color: AppStyle.whiteColor, fontSize: 14),
                )),
              ),
              const SizedBox(width: 5),
              // surah name
              Text(surah.name, style: AppStyle.bodyTextStyle),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // surah name in english
                  Text(
                    surah.enName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  // surah name translate
                  Text(
                    '${surah.enNameTrans} (${surah.numberOfAyahs})',
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            ]),
          )),
    );
  }
}
