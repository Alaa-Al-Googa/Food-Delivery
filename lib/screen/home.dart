import 'package:flutter/material.dart';
import 'package:gazaburger/screen/bottom_navigation_screen/chat_screen.dart';
import 'package:gazaburger/screen/bottom_navigation_screen/favorite_screen.dart';
import 'package:gazaburger/screen/bottom_navigation_screen/home_Screen.dart';
import 'package:gazaburger/screen/bottom_navigation_screen/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  String home = 'Home';
  String favorite = 'Favorite';
  String chat = 'Chat';
  String profile = 'Profile';

  final List<String> _titles = ["Home", "Favorite", "Chat", "Profile"];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffFE8C00),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15, // حجم النص المحدد
        unselectedFontSize: 12,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: home),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: favorite,
          ),
          BottomNavigationBarItem(icon: const Icon(Icons.chat), label: chat),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: profile,
          ),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}
