import 'package:flutter/material.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/ui/common/my_flutter_app_icons.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/bookmark_button.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/icon_button_widget.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/play_button.dart';
import 'package:quran_app/utils/app_style.dart';
import 'package:quran_app/utils/theme_preferences.dart';

class AyahItemWidget extends StatefulWidget {
  final Ayah ayah;
  final int surahNumber;
  const AyahItemWidget({
    Key? key,
    required this.ayah,
    required this.surahNumber,
  }) : super(key: key);

  @override
  State<AyahItemWidget> createState() => _AyahItemWidgetState();
}

class _AyahItemWidgetState extends State<AyahItemWidget> {
  bool theme = ThemePreferences().getThemeMode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppStyle.paddin / 2),
      padding: const EdgeInsets.all(AppStyle.paddin / 2),
      decoration: BoxDecoration(
        color: theme ? AppStyle.darkColor2 : AppStyle.whiteColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.1))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      //

      child: Column(
        children: [
          // top bar of ayah widget
          SizedBox(
            height: 50,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  // ayah number container
                  Container(
                    width: 33,
                    height: 40,
                    // design
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppStyle.secondaryColor,
                    ),

                    //
                    // Counter
                    child: Center(
                      child: Text(
                        '${widget.ayah.number}',
                        style: const TextStyle(
                            color: AppStyle.whiteColor, fontSize: 16),
                      ),
                    ),
                    //
                  ),
                  // if the have sajda true
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
                  // copy button to copy ayah
                  CustomIconButton(
                      icon: const Icon(Icons.copy_outlined),
                      onPressed: () {},
                      size: 20),
                  PlayButton(
                      id: widget.ayah.number - 1, url: widget.ayah.audio),
                  // mark Button to save ayah in bookmark
                  BookMarkButtonWidget(
                      ayah: widget.ayah, surahNumber: widget.surahNumber),
                ],
              ),
            ),
          ),
          //
          // divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: Colors.grey),
          ),

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
        ],
      ),
    );
  }
}
