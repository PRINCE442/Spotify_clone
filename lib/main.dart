import 'package:flutter/material.dart';
import 'package:spotify_clone/Navigations/tab_bar.dart';

void main() {
  runApp(const SpotifyClone());
}

class SpotifyClone extends StatefulWidget {
  const SpotifyClone({super.key});

  @override
  State<SpotifyClone> createState() => _SpotifyCloneState();
}

class _SpotifyCloneState extends State<SpotifyClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white10,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
          )),
      home: const BottomTabBar(),
    );
  }
}
