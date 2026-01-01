import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final List<Widget> children;
  final Duration initialDelay;
  final Duration staggerDelay;
  final Duration itemDuration;
  final Axis direction;

  const StaggerAnimation({
    super.key,
    required this.children,
    this.initialDelay = const Duration(milliseconds: 100),
    this.staggerDelay = const Duration(milliseconds: 100),
    this.itemDuration = const Duration(milliseconds: 600),
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        children.length,
        (index) => _StaggerItem(
          delay: initialDelay + (staggerDelay * index),
          duration: itemDuration,
          direction: direction,
          child: children[index],
        ),
      ),
    );
  }
}

class _StaggerItem extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Axis direction;

  const _StaggerItem({
    required this.child,
    required this.delay,
    required this.duration,
    required this.direction,
  });

  @override
  State<_StaggerItem> createState() => _StaggerItemState();
}

class _StaggerItemState extends State<_StaggerItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    final offset = widget.direction == Axis.vertical
        ? const Offset(0, 0.1)
        : const Offset(0.1, 0);

    _slideAnimation = Tween<Offset>(
      begin: offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
