import 'package:app_1/api_integration.dart';
import 'package:app_1/page1.dart';
import 'package:app_1/page2.dart';
import 'package:app_1/page3.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Bottomna extends StatefulWidget {
  const Bottomna({super.key});

  @override
  State<Bottomna> createState() => _BottomnaState();
}

class _BottomnaState extends State<Bottomna> {
  int currentIndex = 0;
  void updateIndex(int index) {
    //setState(() {
    currentIndex = index;
    // });
  }

  List<Widget> pages = [Home(), APIIntegration(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
        ],
        onTap: (value) {
          setState(() {
            updateIndex(value);
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        currentIndex: currentIndex,
      ),
    );
  }
}
