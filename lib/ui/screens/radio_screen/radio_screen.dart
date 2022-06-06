import 'package:flutter/material.dart';
import 'package:quran_app/ui/screens/radio_screen/widgets/custom_toggle_widget.dart';
import 'package:quran_app/utils/app_style.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppStyle.paddin),
          child: ListView(
            shrinkWrap: true,
            children: const [
              Text(
                'الراديو',
                style: AppStyle.titleTextStyle,
                textAlign: TextAlign.end,
              ),
              CustomToggleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
