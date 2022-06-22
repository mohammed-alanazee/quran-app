import 'package:flutter/material.dart';
import 'package:quran_app/models/radio.dart';
import 'package:quran_app/ui/common/play_button.dart';
import 'package:quran_app/utils/app_style.dart';

class RadioWidget extends StatelessWidget {
  final int index;
  final RadioModel radioModel;
  const RadioWidget({Key? key, required this.radioModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: AppStyle.darkColor2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        leading: PlayButton(
          index: index,
          url: radioModel.url,
        ),
        title: Text(radioModel.name, textDirection: TextDirection.rtl),
      ),
    );
  }
}
