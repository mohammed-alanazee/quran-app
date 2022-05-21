import 'package:flutter/material.dart';
import 'package:quran_app/services/local_storage.dart';
import 'package:quran_app/ui/screens/home_screen/home_screen.dart';
import 'package:quran_app/ui/screens/settings_screen/settings_screen.dart';
import 'package:quran_app/utils/theme_preferences.dart';
import 'base/providers.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'utils/app_style.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  BookMarkStorage().deleteAll();
  await Hive.openBox('darkMode');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemePreferences theme = ThemePreferences();
    return MultiProvider(
      providers: providers,
      child: ValueListenableBuilder(
          valueListenable: theme.box.listenable(),
          builder: (context, box, widget) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Quran App',
              themeMode:
                  theme.getThemeMode() ? ThemeMode.dark : ThemeMode.light,
              theme: AppStyle.lightTheme,
              darkTheme: AppStyle.darkTheme,
              home: const NavigationBar(),
            );
          }),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    ThemePreferences theme = ThemePreferences();
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: theme.box.listenable(),
        builder: (context, box, widget) {
          return BottomNavigationBar(
              // style
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppStyle.primaryColor,
              backgroundColor: theme.getThemeMode()
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
              ]);
        },
      ),
      body: screens[selectedIndex],
    );
  }
}
