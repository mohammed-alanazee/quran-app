import 'package:quran_app/models/surah.dart';
import 'package:quran_app/utils/theme_provider.dart';
import 'package:quran_app/utils/app_style.dart';
import 'package:provider/provider.dart';

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
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
          height: 75,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: context.watch<ThemeProvider>().isDark
                ? AppStyle.darkColor2
                : AppStyle.whiteColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.1))
            ],
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
                  '${widget.surah.number}',
                  style:
                      const TextStyle(color: AppStyle.whiteColor, fontSize: 14),
                )),
              ),
              const SizedBox(width: 5),
              // surah name
              Text(widget.surah.name, style: AppStyle.bodyTextStyle),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // surah name in english
                  Text(
                    widget.surah.enName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  // surah name translate
                  Text(
                    '${widget.surah.enNameTrans} (${widget.surah.numberOfAyahs})',
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
