import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_style.dart';

class LastReadingWidget extends StatelessWidget {
  const LastReadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // last reading widget
    return Container(
      //style
      padding: const EdgeInsets.all(AppStyle.paddin),
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 15, spreadRadius: -5, color: AppStyle.secondaryColor)
        ],
        gradient: const LinearGradient(
          colors: [
            AppStyle.primaryColor,
            AppStyle.secondaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      //
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/quran.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('أخر ما قرأت ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7))),
              const SizedBox(height: 15),
              Text('الفاتحة',
                  style: AppStyle.titleTextStyle
                      .copyWith(color: AppStyle.whiteColor)),
              Text('Al-Faatiha',
                  style: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.7)))
            ],
          )
        ],
      ),
    );
  }
}
