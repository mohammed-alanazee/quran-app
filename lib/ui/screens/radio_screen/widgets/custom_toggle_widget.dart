import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_style.dart';

class CustomToggleWidget extends StatefulWidget {
  const CustomToggleWidget({Key? key}) : super(key: key);

  @override
  State<CustomToggleWidget> createState() => _CustomWidgeToggletState();
}

class _CustomWidgeToggletState extends State<CustomToggleWidget> {
  bool isRadio = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: Stack(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () => setState(() => isRadio = true),
                child: const Text('الاذاعة',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      AppStyle.secondaryColor.withOpacity(0.2)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                    ),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppStyle.darkColor2),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(100, 40)),
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() => isRadio = false),
                child:
                    const Text('القراء', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      AppStyle.secondaryColor.withOpacity(0.2)),
                  splashFactory: InkRipple.splashFactory,
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                    ),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppStyle.darkColor2),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(100, 40)),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: AnimatedAlign(
              widthFactor: 200,
              alignment: isRadio ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 115,
                height: 40,
                decoration: BoxDecoration(
                    color: AppStyle.secondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    isRadio ? 'الاذاعة' : 'القراء',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
