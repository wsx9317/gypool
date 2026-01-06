import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onLongPressEnd;
  final Function()? onDoubleTap;
  final Widget child;
  const ButtonWidget({
    super.key,
    this.onTap,
    this.onLongPress,
    this.onLongPressEnd,
    this.onDoubleTap,
    required this.child,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap ?? () {},
        onLongPress: widget.onLongPress ?? () {},
        onDoubleTap: widget.onDoubleTap ?? () {},
        onLongPressEnd: widget.onLongPressEnd != null
            ? (details) {
                widget.onLongPressEnd!();
              }
            : null,
        child: widget.child,
      ),
    );
  }
}
