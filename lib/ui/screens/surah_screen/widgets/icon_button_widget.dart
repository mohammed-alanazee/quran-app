import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_style.dart';

class CustomIconButton extends StatefulWidget {
  final Icon icon;
  final double size;
  final int? id;

  final VoidCallback onPressed;
  const CustomIconButton({
    Key? key,
    this.id,
    required this.icon,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Material(
        elevation: 0.0,
        color: Colors.transparent,
        child: IconButton(
          icon: widget.icon,
          onPressed: () {
            widget.onPressed();
          },
          iconSize: widget.size,
          splashRadius: 19,
          splashColor: AppStyle.primaryColor.withOpacity(0.1),
          highlightColor: AppStyle.primaryColor.withOpacity(0.1),
          alignment: Alignment.center,
          color: AppStyle.primaryColor,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}