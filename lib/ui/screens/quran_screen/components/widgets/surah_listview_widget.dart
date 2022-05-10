import 'package:flutter/material.dart';
import 'package:quran_app/models/surah.dart';
import 'surah_item_widget.dart';

class SuarhListViewWidget extends StatefulWidget {
  final List<Surah> surahs;
  const SuarhListViewWidget({Key? key, required this.surahs}) : super(key: key);

  @override
  State<SuarhListViewWidget> createState() => _SuarhListViewWidgetState();
}

class _SuarhListViewWidgetState extends State<SuarhListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.surahs.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SurahItemWidget(
          surah: widget.surahs[index],
        );
      },
      shrinkWrap: true,
    );
  }
}
