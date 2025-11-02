import 'package:flutter/material.dart';
import 'package:animated_bottom_nav_bar/animated_bottom_nav_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<IconData> icons = [
    Icons.abc,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Current Tab: $_selectedIndex'),
        ),
        bottomNavigationBar: AnimatedBottomNavBar(
          icons: icons,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          iconActiveColor: Colors.deepPurple,
          iconInactiveColor: Colors.white,
          containerActiveColor: Colors.purple.shade50,
          backgroundColor: const Color.fromARGB(255, 98, 17, 17),
        ),
      ),
    );
  }
}
