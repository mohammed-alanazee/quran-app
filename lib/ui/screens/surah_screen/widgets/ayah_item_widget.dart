import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/ui/my_flutter_app_icons.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/icon_button_widget.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/play_button.dart';
import 'package:quran_app/utils/app_style.dart';
import 'package:quran_app/utils/theme_provider.dart';

class AyahItemWidget extends StatefulWidget {
  final Ayah ayah;
  const AyahItemWidget({Key? key, required this.ayah}) : super(key: key);

  @override
  State<AyahItemWidget> createState() => _AyahItemWidgetState();
}

class _AyahItemWidgetState extends State<AyahItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppStyle.paddin / 2),
      padding: const EdgeInsets.all(AppStyle.paddin / 2),
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
      child: Column(children: [
       
        Container(
            width: double.infinity,
            height: 50,
            // container design
            decoration: BoxDecoration(
              color: context.watch<ThemeProvider>().isDark
                  ? AppStyle.darkColor2
                  : AppStyle.whiteColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            //
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ayah number container
                  Container(
                    width: 33,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppStyle.secondaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.ayah.number}',
                        style: const TextStyle(
                            color: AppStyle.whiteColor, fontSize: 16),
                      ),
                    ),
                  ),
                  widget.ayah.sajda
                      ? IconButton(
                          icon: const Icon(
                            MyFlutterApp.sajdahIcon,
                            color: Colors.amber,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      : Container(),
                  // empty space
                  const Spacer(),
                  // copy Button
                  CustomIconButton(
                      icon: const Icon(Icons.copy_outlined),
                      onPressed: () {},
                      size: 20),

                  PlayButton(
                      id: widget.ayah.number - 1, url: widget.ayah.audio),
                  // mark Button
                  CustomIconButton(
                      id: widget.ayah.number - 1,
                      // is it marked?
                      icon: 3 != 2
                          ? const Icon(Icons.bookmark_outline_outlined)
                          : const Icon(Icons.bookmark),
                      size: 27,
                      onPressed: () => print('objectssss')),
                ],
              ),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(color: Colors.grey),
        ),
        // empty space

        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // arabic ayah text
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.ayah.ayahTextAr,
                  textDirection: TextDirection.rtl,
                  style: AppStyle.ayahTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              // english ayah text
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.ayah.ayahTextEn,
                  textDirection: TextDirection.ltr,
                  style: AppStyle.ayahTextStyle.copyWith(
                    color: const Color.fromARGB(255, 159, 159, 159),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
