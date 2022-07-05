import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/ui/screens/home_screen/home_screen.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/ayah_list_widget.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/surah_des_widget.dart';
import 'package:quran_app/utils/app_style.dart';

class SurahScreen extends StatefulWidget {
  final Surah surah;
  const SurahScreen({Key? key, required this.surah}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProv = context.read<ThemeProvider>().isDark;
    var audioProvider = context.read<AudioPlayerProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(widget.surah.name),
        centerTitle: true,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back_ios,
              color: themeProv ? AppStyle.whiteColor : AppStyle.darkColor),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));

            audioProvider.index = null;
            audioProvider.isPlaying = false;
            audioProvider.advancedPlayer.stop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppStyle.paddin + 5),
          child: Column(
            children: [
              //
              SurahDescription(surah: widget.surah),
              // empty space
              const SizedBox(height: 20),
              AyahListWidget(number: widget.surah.number)
            ],
          ),
        ),
      ),
    );
  }
}
