import 'package:flutter/material.dart';

class LocalImgWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final String assetPath;
  final double? borderRadius;
  final BoxFit boxFit;
  const LocalImgWidget({
    super.key,
    this.width,
    this.height,
    required this.assetPath,
    this.borderRadius,
    required this.boxFit,
  });

  @override
  State<LocalImgWidget> createState() => _LocalImgWidgetState();
}

class _LocalImgWidgetState extends State<LocalImgWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      child: SizedBox(
        width: widget.width ?? 100,
        height: widget.height ?? 100,
        child: Image.asset(widget.assetPath, fit: widget.boxFit),
      ),
    );
  }
}
