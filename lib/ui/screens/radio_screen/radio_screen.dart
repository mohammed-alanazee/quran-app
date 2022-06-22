import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/radio.dart';
import 'package:quran_app/providers/radio_provider.dart';
import 'package:quran_app/ui/common/loding_listview.dart';
import 'package:quran_app/ui/screens/radio_screen/widgets/custom_toggle_widget.dart';
import 'package:quran_app/ui/screens/radio_screen/widgets/radio_widget.dart';
import 'package:quran_app/utils/app_style.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RadioProvider>().getLists();
  }

  @override
  Widget build(BuildContext context) {
    List<RadioModel> sur = context.watch<RadioProvider>().radios;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppStyle.paddin),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                'الراديو',
                style: AppStyle.titleTextStyle,
                textAlign: TextAlign.end,
              ),
              const CustomToggleWidget(),
              sur.isEmpty
                  ? const LodingListView()
                  : ListView.builder(
                      itemBuilder: (context, index) => RadioWidget(
                        radioModel: sur[index],
                        index: index,
                      ),
                      itemCount: sur.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
