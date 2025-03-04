import 'package:flutter/material.dart';
import 'index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int idx = 0;

  List<Widget> pages = [Screen1(), Screen2(), Screen3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.screenshot_outlined), label: 'Screen1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.screenshot_outlined), label: 'Screen2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.screenshot_outlined), label: 'Screen3'),
        ],
        currentIndex: idx,
        onTap: (value) {
          setState(() {
            idx = value;
          });
        },
      ),
    );
  }
}
