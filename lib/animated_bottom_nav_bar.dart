library animated_bottom_nav_bar;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  /// List of icons to display in the bar
  final List<IconData> icons;

  /// Current selected index
  final int currentIndex;

  /// Callback when a tab is tapped
  final ValueChanged<int> onTap;

  /// Background color of the container
  final Color? backgroundColor;

  /// Active and inactive icon colors
  final Color iconActiveColor;
  final Color iconInactiveColor;
  /// Active container color
  final Color containerActiveColor;

  /// Container margin and height
  final double height;
  final EdgeInsetsGeometry margin;

  const AnimatedBottomNavBar({
    Key? key,
    required this.icons,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.iconActiveColor = Colors.blue,
    this.iconInactiveColor = Colors.grey,
    this.containerActiveColor = const Color(0xFFE0F7FA),

    this.height = 60,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  }) : super(key: key);

  @override
  State<AnimatedBottomNavBar> createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.icons.length,
      (_) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      ),
    );

    _controllers[widget.currentIndex].forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controllers[oldWidget.currentIndex].reverse();
      _controllers[widget.currentIndex].forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, -2),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.icons.length, (index) {
          final isActive = widget.currentIndex == index;
          final controller = _controllers[index];

          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: Animate(
              controller: controller,
              autoPlay: false,
              effects: [
                Effect(duration: 975.ms),
                Effect(delay: 175.ms, duration: 750.ms),
                const ScaleEffect(end: Offset(1, 1), curve: Curves.easeOutBack),
                const MoveEffect(end: Offset(0, -5)),

                ElevationEffect(
                  end: _controllers[index].isForwardOrCompleted ? 1.5 : 0,
                  curve: Curves.easeOutBack,
                  borderRadius: BorderRadius.circular(12),
                  delay: 175.ms,
                  duration: 750.ms,
                ),
              ],

              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isActive ? widget.containerActiveColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icons[index],
                  color: isActive
                      ? widget.iconActiveColor
                      : widget.iconInactiveColor,
                  size: 30,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }
}
