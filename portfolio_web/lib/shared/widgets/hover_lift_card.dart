import 'package:flutter/material.dart';

class HoverLiftCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double liftAmount;
  final double scaleAmount;
  final Duration duration;
  final BorderRadius? borderRadius;
  final Function(bool)? onHover;

  const HoverLiftCard({
    super.key,
    required this.child,
    this.onTap,
    this.liftAmount = -6.0,
    this.scaleAmount = 1.015,
    this.duration = const Duration(milliseconds: 200),
    this.borderRadius,
    this.onHover,
  });

  @override
  State<HoverLiftCard> createState() => _HoverLiftCardState();
}

class _HoverLiftCardState extends State<HoverLiftCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        if (widget.onHover != null) widget.onHover!(true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        if (widget.onHover != null) widget.onHover!(false);
      },
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translateByDouble(0, _isHovered ? widget.liftAmount : 0, 0, 1)
            ..scaleByDouble(
              _isHovered ? widget.scaleAmount : 1.0,
              _isHovered ? widget.scaleAmount : 1.0,
              1.0,
              1.0,
            ),
          child: widget.child,
        ),
      ),
    );
  }
}
