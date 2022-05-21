import 'package:quran_app/providers/audio_player_provider.dart';
import 'package:quran_app/providers/bookmar_provider.dart';
import 'package:quran_app/providers/quran_provider.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<QuranProvider>(
    create: (_) => QuranProvider(),
  ),
  ChangeNotifierProvider<AudioPlayerProvider>(
    create: (_) => AudioPlayerProvider(),
  ),
  ChangeNotifierProvider<BookMarkProvider>(
    create: (_) => BookMarkProvider(),
  )
];
