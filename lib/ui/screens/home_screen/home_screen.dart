import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/quran_provider.dart';
import 'package:quran_app/ui/widgets/loding_listview.dart';
import '/utils/app_style.dart';
import 'widgets/last_reading_widget.dart';
import 'widgets/surah_listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuranProvider>().getSurahList();
  }

  @override
  Widget build(BuildContext context) {
    var quranProvider = context.watch<QuranProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppStyle.paddin),
            child: SizedBox(
              child: Column(
                children: [
                  const LastReadingWidget(),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الفهرس',
                      style: AppStyle.titleTextStyle,
                    ),
                  ),
                  quranProvider.surahList.isNotEmpty
                      ? SuarhListViewWidget(surahs: quranProvider.surahList)
                      : const LodingListView()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
