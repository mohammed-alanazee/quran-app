import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/reciter.dart';
import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/ui/common/play_button.dart';
import 'package:quran_app/utils/app_style.dart';

class ReciterItemWidget extends StatelessWidget {
  final int selectedSurah;
  final Reciter reciter;
  const ReciterItemWidget(
      {Key? key, required this.reciter, required this.selectedSurah})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeProvider>().isDark
        ? AppStyle.darkColor2
        : AppStyle.whiteColor;
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: color,
          boxShadow: AppStyle.shadow,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        title: Text(
          reciter.name,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Text(reciter.rewaya, textDirection: TextDirection.rtl),
        leading: PlayButton(
          index: reciter.id,
          url:
              AudioPlayerProvider().intiializUrl(reciter.server, selectedSurah),
        ),
      ),
    );
  }
}
