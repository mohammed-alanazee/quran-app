import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:quran_app/providers/bookmark_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/radio_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
  ),
  ChangeNotifierProvider<AudioPlayerProvider>(
    create: (_) => AudioPlayerProvider(),
  ),
  ChangeNotifierProvider<BookMarkProvider>(
    create: (_) => BookMarkProvider(),
  ),
  ChangeNotifierProvider<RadioProvider>(
    create: (_) => RadioProvider(),
  )
];
