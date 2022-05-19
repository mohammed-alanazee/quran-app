import 'package:flutter/material.dart';
import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/ui/my_flutter_app_icons.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/icon_button_widget.dart';

class PlayButton extends StatefulWidget {
  final int id;
  final String url;

  const PlayButton({
    Key? key,
    required this.id,
    required this.url,
  }) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var playerProvider = context.watch<AudioPlayerProvider>();
    return CustomIconButton(
      key: UniqueKey(),
      id: widget.id,
      icon: (() {
        if (context.watch<AudioPlayerProvider>().selectedAyah == widget.id) {
          if (context.watch<AudioPlayerProvider>().isPlaying) {
            return const Icon(
              MyFlutterApp.pauseIcon,
            );
          } else {
            return const Icon(
              MyFlutterApp.playIcon,
            );
          }
        } else {
          return const Icon(
            MyFlutterApp.playIcon,
          );
        }
      })(),
      size: 20,
      onPressed: () {
        playerProvider.changeSelectedAyah(widget.id);
        playerProvider.controllerAudio(widget.url);
      },
    );
  }
}
