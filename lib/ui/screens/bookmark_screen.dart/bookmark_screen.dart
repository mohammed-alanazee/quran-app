import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/providers/bookmar_provider.dart';
import 'package:quran_app/ui/common/loding_listview.dart';
import 'package:quran_app/ui/screens/surah_screen/widgets/ayah_item_widget.dart';
import 'package:quran_app/utils/app_style.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    context.read<BookMarkProvider>().getMarkedAyahList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Ayah> marekdAyahList =
        context.watch<BookMarkProvider>().markedAyahList;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppStyle.paddin,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'الفهرس',
                  style: AppStyle.titleTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              marekdAyahList.isNotEmpty
                  ? ListView.builder(
                      itemCount: marekdAyahList.length,
                      itemBuilder: (context, index) => AyahItemWidget(
                        ayah: marekdAyahList[index],
                        showAyahNumber: false,
                      ),
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
