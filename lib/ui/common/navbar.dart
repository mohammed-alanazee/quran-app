import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/ui/screens/bookmark_screen.dart/bookmark_screen.dart';
import 'package:quran_app/ui/screens/home_screen/home_screen.dart';
import 'package:quran_app/ui/screens/radio_screen/radio_screen.dart';
import 'package:quran_app/ui/screens/settings_screen/settings_screen.dart';
import 'package:quran_app/utils/app_style.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidget();
}

class _NavigationBarWidget extends State<NavigationBarWidget> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const BookMarkScreen(),
    const RadioScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            // style
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppStyle.primaryColor,
            backgroundColor: context.watch<ThemeProvider>().isDark
                ? AppStyle.darkColor
                : const Color(0xC4FEFEFE),
            showUnselectedLabels: false,
            unselectedItemColor: const Color(0xFF6F6F6F),
            //
            onTap: (int index) => setState(() => selectedIndex = index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  activeIcon: Icon(Icons.home),
                  label: 'الصفحة الرئيسة'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_border,
                  ),
                  activeIcon: Icon(Icons.bookmark),
                  label: 'الفواصل'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.radio_outlined,
                  ),
                  activeIcon: Icon(Icons.radio),
                  label: 'راديو'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                activeIcon: Icon(Icons.settings),
                label: 'الإعدادت',
              )
            ]),
        body: IndexedStack(
          children: screens,
          index: selectedIndex,
        ));
  }
}
