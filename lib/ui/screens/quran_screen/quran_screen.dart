import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/quran_provider.dart';
import 'components/widgets/last_reading_widget.dart';
import 'components/widgets/surah_listview_widget.dart';
import '/utils/app_style.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuranProvider>().getSurahList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppStyle.paddin),
            child: SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 30,
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const LastReadingWidget(),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الفهرس',
                      style: AppStyle.titleTextStyle,
                    ),
                  ),
                  SuarhListViewWidget(
                      surahs: context.read<QuranProvider>().surahList),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
