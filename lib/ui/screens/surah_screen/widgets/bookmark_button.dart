import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/providers/bookmar_provider.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/custom_icon_buttton.dart';

class BookMarkButtonWidget extends StatefulWidget {
  final Ayah ayah;

  const BookMarkButtonWidget({
    Key? key,
    required this.ayah,
  }) : super(key: key);

  @override
  State<BookMarkButtonWidget> createState() => _BookMarkButtonWidgetState();
}

class _BookMarkButtonWidgetState extends State<BookMarkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<BookMarkProvider>();
    var isMarked = prov.getMarkedAyah(widget.ayah.ayahTextAr);
    return CustomIconButton(
      id: widget.ayah.number - 1,
      icon: isMarked
          ? const Icon(Icons.bookmark)
          : const Icon(Icons.bookmark_outline_outlined),
      size: 27,
      onPressed: () {
        if (isMarked) {
          prov.deleteMarkedAyah(
            widget.ayah,
          );
        } else {
          var ayah = Ayah(
            number: widget.ayah.number,
            surahNumber: widget.ayah.surahNumber,
            audio: widget.ayah.audio,
            ayahTextAr: widget.ayah.ayahTextAr,
            ayahTextEn: widget.ayah.ayahTextEn,
            sajda: widget.ayah.sajda,
            isMarked: true,
          );

          prov.addAyahToBookMark(
            ayah,
          );
        }
      },
    );
  }
}
