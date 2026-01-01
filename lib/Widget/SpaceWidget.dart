import 'package:flutter/material.dart';

class SpaceWidget extends StatefulWidget {
  final double width;
  final double height;
  const SpaceWidget({super.key, required this.width, required this.height});

  @override
  State<SpaceWidget> createState() => _SpaceWidgetState();
}

class _SpaceWidgetState extends State<SpaceWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: widget.width, height: widget.height);
  }
}
