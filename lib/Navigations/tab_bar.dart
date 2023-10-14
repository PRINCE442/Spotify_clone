import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/home.dart';
import 'package:spotify_clone/Screens/library.dart';
import 'package:spotify_clone/Screens/profile.dart';
import 'package:spotify_clone/Screens/search.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _seletedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seletedTab,
        onTap: (value) {
          setState(() {
            _seletedTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Your Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: Stack(
        children: [
          renderview(0, const Homepage()),
          renderview(1, const SearchPage()),
          renderview(2, const LibraryPage()),
          renderview(3, const ProfilePage()),
        ],
      ),
    );
  }

  Widget renderview(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _seletedTab != tabIndex,
      child: Opacity(
        opacity: _seletedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
