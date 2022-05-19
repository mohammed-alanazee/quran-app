import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:quran_app/providers/quran_provider.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/ayah_item_widget.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/surah_des_widget.dart';
import 'package:quran_app/ui/widgets/loding_listview.dart';
import 'package:quran_app/utils/app_style.dart';

class SurahScreen extends StatefulWidget {
  final Surah surah;
  const SurahScreen({Key? key, required this.surah}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  void initState() {
    context.read<QuranProvider>().getAyahBySuarh(widget.surah.number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var quranProvider = context.watch<QuranProvider>();
    var audioProvider = context.read<AudioPlayerProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(widget.surah.name),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            // to turn off the audio before poping
            audioProvider.selectedAyah = null;
            audioProvider.isPlaying = false;
            audioProvider.advancedPlayer.stop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
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
              quranProvider.ayahlist.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quranProvider.ayahlist.length,
                      itemBuilder: (context, int index) =>
                          AyahItemWidget(ayah: quranProvider.ayahlist[index]),
                      shrinkWrap: true,
                    )
                  : const LodingListView()
            ],
          ),
        ),
      ),
    );
  }
}
