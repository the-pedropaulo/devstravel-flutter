import 'package:devstravel/src/pages/continent.dart';
import 'package:devstravel/src/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/preload.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppData())],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/preload': (BuildContext context) => const PreloadPage(),
        '/home': (BuildContext context) => HomePage(),
        '/search': (BuildContext context) => const SearchPage(),
        '/continent': (BuildContext context) => const ContinentPage(),
      },
      initialRoute: '/preload',
    );
  }
}
