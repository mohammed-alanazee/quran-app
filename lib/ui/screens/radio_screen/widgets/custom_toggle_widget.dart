import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/utils/app_style.dart';

class CustomToggleWidget extends StatefulWidget {
  final bool isRadio;
  final VoidCallback onPressed;
  const CustomToggleWidget(
      {Key? key, required this.isRadio, required this.onPressed})
      : super(key: key);

  @override
  State<CustomToggleWidget> createState() => _CustomWidgeToggletState();
}

class _CustomWidgeToggletState extends State<CustomToggleWidget> {
  @override
  Widget build(BuildContext context) {
    var prov = context.read<ThemeProvider>().isDark;
    return SizedBox(
      width: 200,
      height: 40,
      child: Stack(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: widget.onPressed,
                child: Text('الاذاعة',
                    style:
                        TextStyle(color: prov ? Colors.white : Colors.black)),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      AppStyle.secondaryColor.withOpacity(0.2)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                    ),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      prov ? AppStyle.darkColor2 : AppStyle.whiteColor),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(100, 40)),
                ),
              ),
              ElevatedButton(
                onPressed: widget.onPressed,
                child: Text('القراء',
                    style:
                        TextStyle(color: prov ? Colors.white : Colors.black)),
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
                  backgroundColor: MaterialStateProperty.all<Color>(
                      prov ? AppStyle.darkColor2 : AppStyle.whiteColor),
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
              alignment:
                  widget.isRadio ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 115,
                height: 40,
                decoration: BoxDecoration(
                    color: AppStyle.secondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    widget.isRadio ? 'الاذاعة' : 'القراء',
                    style: const TextStyle(color: Colors.white),
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
