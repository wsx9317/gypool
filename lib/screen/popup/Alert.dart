import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/ButoonWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/Widget/TextWidget.dart';

class Alert extends StatefulWidget {
  final int type; // 0: info, 1: warning, 2: error
  final Function()? closeFunction;
  final String? title;
  final String? message;
  final String? buttonText1;
  final String? buttonText2;
  final Function()? buttonFunction1;
  final Function()? buttonFunction2;

  const Alert({
    super.key,
    required this.type,
    this.closeFunction,
    this.title,
    this.message,
    this.buttonText1,
    this.buttonText2,
    this.buttonFunction1,
    this.buttonFunction2,
  });

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: UiColor.black90Per,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              ButtonWidget(
                onTap: widget.closeFunction,
                child: Icon(Icons.close, color: UiColor.white, size: 24),
              ),
            ],
          ),
          SpaceWidget(width: 0, height: 20),
          Visibility(
            visible: widget.title != null,
            child: Column(
              children: [
                Textwidget(
                  text: widget.title ?? '',
                  fontSize: 20,
                  fontSpacing: 0,
                  fontHeight: 1.2,
                  fontWeight: FontWeight.w600,
                  fontColor: UiColor.white,
                  textAlign: TextAlign.center,
                ),
                SpaceWidget(width: 0, height: 20),
              ],
            ),
          ),
          Visibility(
            visible: widget.message != null,
            child: Textwidget(
              text: widget.message ?? '',
              fontSize: 16,
              fontSpacing: 0,
              fontHeight: 1.5,
              fontWeight: FontWeight.w400,
              fontColor: UiColor.white70per,
              textAlign: TextAlign.center,
            ),
          ),

          SpaceWidget(width: 0, height: 30),
          if (widget.type == 2)
            ButtonWidget(
              onTap: widget.buttonFunction1,
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: UiColor.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Textwidget(
                    text: widget.buttonText1 ?? '확인',
                    fontSize: 16,
                    fontSpacing: 0,
                    fontHeight: 1.2,
                    fontWeight: FontWeight.w600,
                    fontColor: UiColor.white100per,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          if (widget.type == 0 || widget.type == 1)
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    onTap: widget.buttonFunction2,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: UiColor.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Textwidget(
                          text: widget.buttonText2 ?? '취소',
                          fontSize: 16,
                          fontSpacing: 0,
                          fontHeight: 1.2,
                          fontWeight: FontWeight.w600,
                          fontColor: UiColor.white100per,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SpaceWidget(width: 10, height: 0),
                Expanded(
                  child: ButtonWidget(
                    onTap: widget.buttonFunction1,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: UiColor.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Textwidget(
                          text: widget.buttonText1 ?? '확인',
                          fontSize: 16,
                          fontSpacing: 0,
                          fontHeight: 1.2,
                          fontWeight: FontWeight.w600,
                          fontColor: UiColor.white100per,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
