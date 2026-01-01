import 'package:flutter/material.dart';

class ButoonWidget extends StatefulWidget {
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onLongPressEnd;
  final Function()? onDoubleTap;
  final Widget child;
  const ButoonWidget({
    super.key,
    this.onTap,
    this.onLongPress,
    this.onLongPressEnd,
    this.onDoubleTap,
    required this.child,
  });

  @override
  State<ButoonWidget> createState() => _ButoonWidgetState();
}

class _ButoonWidgetState extends State<ButoonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      onLongPress: widget.onLongPress ?? () {},
      onDoubleTap: widget.onDoubleTap ?? () {},
      onLongPressEnd: widget.onLongPressEnd != null
          ? (details) {
              widget.onLongPressEnd!();
            }
          : null,
      child: widget.child,
    );
  }
}
