import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: '宇宙語図鑑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 16),
        ),
      ),
      home: const HomePage(),
    );
  }
}
