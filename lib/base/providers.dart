import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:quran_app/providers/bookmar_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/theme_provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
  ),
  // ChangeNotifierProvider<QuranProvider>(
  //   create: (_) => QuranProvider(),
  // ),
  ChangeNotifierProvider<AudioPlayerProvider>(
    create: (_) => AudioPlayerProvider(),
  ),
  ChangeNotifierProvider<BookMarkProvider>(
    create: (_) => BookMarkProvider(),
  )
];
