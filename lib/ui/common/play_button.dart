import 'package:flutter/material.dart';
import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/ui/common/my_flutter_app_icons.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/custom_icon_buttton.dart';

class PlayButton extends StatefulWidget {
  final int index;
  final String url;

  const PlayButton({
    Key? key,
    required this.index,
    required this.url,
  }) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    var playerProvider = context.watch<AudioPlayerProvider>();
    return CustomIconButton(
      icon: (() {
        if (playerProvider.index == widget.index &&
            playerProvider.isPlaying &&
            playerProvider.url == widget.url) {
          return const Icon(
            MyFlutterApp.pauseIcon,
          );
        } else {
          return const Icon(
            MyFlutterApp.playIcon,
          );
        }
      })(),
      size: 20,
      onPressed: () {
        if (playerProvider.isPlaying) {
          if (playerProvider.url == widget.url) {
            playerProvider.stopAudio();
          } else {
            playerProvider.stopAudio();
            playerProvider.index = widget.index;
            playerProvider.playAudio(widget.url);
          }
        } else {
          playerProvider.index = widget.index;
          playerProvider.playAudio(widget.url);
        }
      },
    );
  }
}
