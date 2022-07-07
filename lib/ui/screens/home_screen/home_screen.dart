import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/models/surah_list.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/services/storage/last_read_surah.dart';
import '/utils/app_style.dart';
import 'widgets/last_reading_widget.dart';
import 'widgets/surah_listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Surah?> lastReadSurah;
  final TextEditingController searchBarController = TextEditingController();
  List<Surah> surahs = surahsData;
  bool isOpened = false;
  @override
  void initState() {
    super.initState();
    lastReadSurah = LastReadSurah().getLastRead();
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
                    child: AnimatedContainer(
                      width: isOpened ? MediaQuery.of(context).size.width : 50,
                      height: 50,
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: context.watch<ThemeProvider>().isDark
                            ? AppStyle.darkColor2
                            : const Color.fromARGB(255, 248, 247, 247),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0.2,
                              blurRadius: 3,
                              offset: const Offset(2, 2))
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(10),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Icon(
                                        isOpened ? Icons.close : Icons.search,
                                      )),
                                  onTap: () {
                                    setState(() {
                                      if (isOpened) {
                                        surahs = surahsData;
                                        isOpened = false;
                                        searchBarController.text = '';
                                      } else {
                                        isOpened = true;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: isOpened
                                    ? TextField(
                                        controller: searchBarController,
                                        onSubmitted: (v) {
                                          setState(() {
                                            surahs = surahsData
                                                .where((element) => element.name
                                                    .contains(
                                                        searchBarController
                                                            .text))
                                                .toList();
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      )
                                    : null,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  searchBarController.text == ''
                      ? const LastReadSurahWidget()
                      : Container(),
                  const SizedBox(height: 20),
                  searchBarController.text == ''
                      ? const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'الفهرس',
                            style: AppStyle.titleTextStyle,
                          ),
                        )
                      : Container(),
                  SuarhListViewWidget(
                    surahs: surahs,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
