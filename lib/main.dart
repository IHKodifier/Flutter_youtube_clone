import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:you_tube_clone/screens/nav_screen.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Flutter YouTube Clone',
      debugShowCheckedModeBanner: false,
      home: PixelPerfect(
        assetPath: 'assets/yt_design.png',
        child: const NavScreen(),
      ),
      theme: ThemeData(
          brightness: Brightness.dark,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(selectedItemColor: Colors.white)),
    );
  }
}
