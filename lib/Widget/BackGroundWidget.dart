import 'package:flutter/material.dart';
import 'package:gypool/common/utils.dart';

class BackgroundWidget extends StatefulWidget {
  final Widget? appBar;
  final Widget bodyChild;
  final Color backgroundColor;
  final Widget? footerChild;
  final Widget? alertChild;
  final bool? isAlert;
  final Color? alertBackgroundColor;
  final double? horizontalPadding;
  const BackgroundWidget({
    super.key,
    this.appBar,
    required this.bodyChild,
    required this.backgroundColor,
    required this.footerChild,
    this.isAlert,
    this.alertChild,
    this.alertBackgroundColor,
    this.horizontalPadding,
  });

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: widget.backgroundColor,
          body: Stack(
            children: [
              Container(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenHeight,
                padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 0.0),
                child: widget.bodyChild,
              ),
              Positioned(top: 0, left: 0, right: 0, child: widget.appBar ?? SizedBox()),
              Positioned(bottom: 0, left: 0, right: 0, child: widget.footerChild ?? SizedBox()),
            ],
          ),
        ),
        if (widget.isAlert ?? false)
          Scaffold(
            backgroundColor: widget.alertBackgroundColor ?? Colors.transparent,
            body: Container(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight,
              padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 0),
              child: Column(children: [Spacer(), widget.alertChild ?? SizedBox(), Spacer()]),
            ),
          ),
      ],
    );
  }
}
