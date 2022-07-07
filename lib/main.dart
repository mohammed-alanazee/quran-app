import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/services/local_notifications_service.dart';
import 'package:quran_app/ui/common/navbar.dart';
import 'package:quran_app/ui/screens/error_screen.dart';
import 'base/providers.dart';
import 'utils/app_style.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoaclNotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasIntrent = false;
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none ||
          result == ConnectivityResult.bluetooth) {
        setState(() => hasIntrent = false);
      } else {
        setState(() => hasIntrent = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer(builder: (context, ThemeProvider theme, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'القرآن الكريم',
          themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          home: hasIntrent
              ? const NavigationBarWidget()
              : ErrorScreen(onPressed: () async {
                  ConnectivityResult result =
                      await (Connectivity().checkConnectivity());
                  if (result == ConnectivityResult.none ||
                      result == ConnectivityResult.bluetooth) {
                    setState(() => hasIntrent = false);
                  } else {
                    setState(() => hasIntrent = true);
                  }
                }),
        );
      }),
    );
  }
}
