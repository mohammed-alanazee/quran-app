import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/reciter.dart';
import 'package:quran_app/models/surah_list.dart';
import 'package:quran_app/providers/radio_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/ui/common/loding_listview.dart';
import 'package:quran_app/ui/screens/radio_screen/widgets/reciter_item_widget.dart';
import 'package:quran_app/utils/app_style.dart';

class RecitersListView extends StatefulWidget {
  const RecitersListView({Key? key}) : super(key: key);

  @override
  State<RecitersListView> createState() => _RecitersListViewState();
}

class _RecitersListViewState extends State<RecitersListView> {
  int selectedSurah = 1;
  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeProvider>().isDark
        ? AppStyle.darkColor2
        : AppStyle.whiteColor;
    List<Reciter> recitersList = context
        .watch<RadioProvider>()
        .reciters
        .where((element) => element.surahs.contains(selectedSurah))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5, bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppStyle.shadow),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownButton<int>(
              // design
              borderRadius: BorderRadius.circular(10),
              dropdownColor: color,
              underline: Container(),
              menuMaxHeight: 300,
              //
              items: surahsData
                  .map(
                    (e) => DropdownMenuItem<int>(
                      child: Text(e.name),
                      value: e.number,
                      alignment: Alignment.centerRight,
                    ),
                  )
                  .toList(),

              value: selectedSurah,
              onChanged: (int? value) {
                setState(() {
                  selectedSurah = value!;
                });
              },
            ),
          ),
        ),
        recitersList.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ReciterItemWidget(
                    reciter: recitersList[index], selectedSurah: selectedSurah),
                itemCount: recitersList.length,
                shrinkWrap: true,
              )
            : const LodingListView()
      ],
    );
  }
}
