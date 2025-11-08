# 🌀 Animated Bottom Nav Bar

A **beautiful and customizable animated bottom navigation bar** for Flutter, built using the [flutter_animate](https://pub.dev/packages/flutter_animate) package.  
It provides smooth scale and elevation effects when switching between tabs.

---

## 🎥 Preview

<p align="center">
<img src="https://raw.githubusercontent.com/adhamAbuAllan/animated_bottom_nav_bar/main/preview.gif" alt="App Preview" />
</p>

---

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
clickable_animated_bottom_nav_bar: ^0.0.3
```
Then run:

```bash
flutter pub get
```

Import the package:
```dart
import 'package:clickable_animated_bottom_nav_bar/animated_bottom_nav_bar.dart';
```

---

## 💡 Usage Example


   ```dart
   import 'package:flutter/material.dart';
import 'package:clickable_animated_bottom_nav_bar/animated_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text("🏠 Home")),
    Center(child: Text("❤️ Favorites")),
    Center(child: Text("👤 Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: AnimatedBottomNavBar(
        icons: const [Icons.home, Icons.favorite, Icons.person],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.white,
        iconActiveColor: Colors.blue,
        iconInactiveColor: Colors.grey,
        containerActiveColor: Colors.blue.withOpacity(0.1),
        height: 65,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}

   ```

---

## ⚙️ Parameters

| Parameter              | Type                 | Description                                   |
| ---------------------- | -------------------- | --------------------------------------------- |
| `icons`                | `List<IconData>`     | List of icons displayed in the bottom bar.    |
| `currentIndex`         | `int`                | Currently selected tab index.                 |
| `onTap`                | `ValueChanged<int>`  | Callback when a tab is tapped.                |
| `backgroundColor`      | `Color?`             | Background color of the navigation bar.       |
| `iconActiveColor`      | `Color`              | Color of the active icon. *(default: blue)*   |
| `iconInactiveColor`    | `Color`              | Color of inactive icons. *(default: grey)*    |
| `containerActiveColor` | `Color`              | Background color for the active item.         |
| `height`               | `double`             | Height of the navigation bar. *(default: 60)* |
| `margin`               | `EdgeInsetsGeometry` | Margin around the navigation bar.             |

---

