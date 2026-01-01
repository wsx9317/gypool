import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class Textwidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final double fontSpacing;
  final double fontHeight;
  final FontWeight fontWeight;
  final Color fontColor;
  final TextAlign textAlign;
  const Textwidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontSpacing,
    required this.fontHeight,
    required this.fontWeight,
    required this.fontColor,
    required this.textAlign,
  });

  @override
  State<Textwidget> createState() => _TextwidgetState();
}

class _TextwidgetState extends State<Textwidget> {
  @override
  Widget build(BuildContext context) {
    return StyledText(
      text: widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontSize: widget.fontSize,
        letterSpacing: widget.fontSpacing,
        fontWeight: widget.fontWeight,
        height: widget.fontHeight,
        color: widget.fontColor,
      ),
      tags: {
        'b': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold)),
        'i': StyledTextTag(style: TextStyle(fontStyle: FontStyle.italic)),
        'u': StyledTextTag(
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      },
      softWrap: true,
    );
  }
}
