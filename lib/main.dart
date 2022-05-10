import 'package:flutter/material.dart';
import 'base/providers.dart';
import 'ui/screens/quran_screen/quran_screen.dart';
import 'utils/app_style.dart';
import 'utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer(
        builder: (context, ThemeProvider theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quran App',
          themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          home: const SelectedScreen(),
        ),
      ),
    );
  }
}

class SelectedScreen extends StatefulWidget {
  const SelectedScreen({Key? key}) : super(key: key);

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const QuranScreen(),
    const Text('sss'),
    const QuranScreen(),
    const QuranScreen(),
    const QuranScreen(),
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
            : const Color.fromARGB(196, 254, 254, 254),
        showUnselectedLabels: false,
        unselectedItemColor: const Color.fromARGB(255, 111, 111, 111),
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
              label: 'الفواصل'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            activeIcon: Icon(Icons.settings),
            label: 'الإعدادت',
          )
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
