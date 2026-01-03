import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/Widget/TextWidget.dart';

class InputValidationWidget extends StatefulWidget {
  final String? lable;
  final double width;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;
  final int? maxLength;
  final Color textColor;
  final Color inputColor;
  final Color? borderColor;
  final double? borderWidth;
  final Color? activeColor;
  final double round;
  final Function()? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function()? onEdit;
  final bool? nextFocus;
  final Function(String)? onChange;
  final String textAlign;
  final Color? enabledBorderColor;
  final String hintText;
  final double hintTextFontSize;
  final FontWeight hintTextfontWeight;
  final Color hintTextFontColor;
  final String keyboardType;
  final Widget? inputWithIcon;
  final String? obscuringCharacter;
  final bool showSearchIcon;
  final double? iconSize;
  final double? iconVerticalSize;
  final double? iconleftSize;
  final String validationText;
  final bool validationVisible;
  final bool vlaidationCheck;
  final bool enabledBool;
  InputValidationWidget({
    super.key,
    this.lable,
    required this.width,
    required this.height,
    required this.verticalPadding,
    required this.horizontalPadding,
    this.maxLength,
    required this.textColor,
    required this.inputColor,
    this.borderColor,
    this.borderWidth,
    this.activeColor,
    required this.round,
    this.onTap,
    this.controller,
    this.focusNode,
    this.onEdit,
    this.nextFocus,
    this.onChange,
    required this.textAlign, //start, end
    this.enabledBorderColor,
    this.obscuringCharacter,
    required this.hintText,
    required this.hintTextFontSize,
    required this.hintTextfontWeight,
    required this.hintTextFontColor,
    required this.keyboardType,
    this.inputWithIcon,
    required this.showSearchIcon,
    this.iconSize,
    this.iconVerticalSize,
    this.iconleftSize,
    required this.validationText,
    required this.validationVisible,
    required this.vlaidationCheck,
    required this.enabledBool,
  });

  @override
  State<InputValidationWidget> createState() => _InputValidationWidgetState();
}

class _InputValidationWidgetState extends State<InputValidationWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.keyboardType == 'number') {
      widget.controller!.addListener(_formatNumber);
    }
  }

  void _formatNumber() {
    if (widget.controller!.text.isNotEmpty) {
      String value = widget.controller!.text.replaceAll(',', '');
      value = value.replaceAll(' ', '');
      int number = 0;
      try {
        number = int.tryParse(value) ?? 0;
      } catch (e) {}
      String formattedValue = numberWithCommas(number);
      if (widget.controller!.text != formattedValue) {
        widget.controller!.value = widget.controller!.value.copyWith(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );
      }
    }
  }

  String numberWithCommas(int number) {
    return number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
  }

  @override
  Widget build(BuildContext context) {
    Widget wg1 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.lable != null)
            ? Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.5),
                      child: Textwidget(
                        text: (widget.lable != null) ? widget.lable! : '',
                        fontSize: 18,
                        fontSpacing: 0,
                        fontHeight: 1.6,
                        fontWeight: FontWeight.w600,
                        fontColor: UiColor.black100Per,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SpaceWidget(width: 0, height: 8),
                ],
              )
            : SizedBox(),
        Stack(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.inputColor,
                borderRadius: BorderRadius.circular(widget.round),
                // 여기가 보더색상
                border: Border.all(color: widget.borderColor ?? widget.inputColor, width: widget.borderWidth ?? 1),
              ),
              child: TextFormField(
                maxLength: widget.maxLength ?? 100,
                inputFormatters: [],
                onTap: widget.onTap,
                focusNode: (widget.focusNode != null) ? widget.focusNode : null,
                controller: (widget.controller != null) ? widget.controller : null,
                onEditingComplete: widget.onEdit,
                onFieldSubmitted: (value) {
                  (widget.nextFocus == true) ? FocusScope.of(context).nextFocus() : null;
                },
                onChanged: widget.onChange,
                enabled: widget.enabledBool,
                obscureText: (widget.keyboardType == 'password' || widget.keyboardType == 'password2') ? true : false,
                obscuringCharacter: (widget.obscuringCharacter != null) ? widget.obscuringCharacter! : '•',
                textAlign: (widget.textAlign == 'start')
                    ? TextAlign.start
                    : (widget.textAlign == 'end')
                    ? TextAlign.end
                    : TextAlign.center,
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.round), borderSide: BorderSide.none),
                  //에러 날때
                  enabledBorder: (widget.enabledBorderColor != null)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (widget.validationVisible) ? UiColor.red : const Color.fromRGBO(0, 0, 0, 0),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(widget.round),
                        )
                      : null,
                  //엑티브 됐을때
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.activeColor ?? UiColor.invisiable, width: 1.0),
                    borderRadius: BorderRadius.circular(widget.round),
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    height: 2,
                    fontSize: widget.hintTextFontSize,
                    color: widget.hintTextFontColor,
                    fontWeight: widget.hintTextfontWeight,
                  ),
                ),
                keyboardType:
                    (widget.keyboardType == 'number' ||
                        widget.keyboardType == 'number2' ||
                        widget.keyboardType == 'number3' ||
                        widget.keyboardType == 'password2')
                    ? TextInputType.number
                    : TextInputType.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontFamily: 'Pretendard',
                  fontSize: widget.hintTextFontSize,
                  height: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Visibility(
              visible: widget.showSearchIcon,
              child: Positioned(
                top: widget.iconVerticalSize ?? 0,
                left: widget.iconleftSize ?? 0,
                bottom: widget.iconVerticalSize ?? 0,
                child: SizedBox(
                  width: widget.iconSize ?? 0,
                  height: widget.iconSize ?? 0,
                  child: Center(child: widget.inputWithIcon),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: widget.validationVisible,
          child: Column(
            children: [
              const SpaceWidget(width: 0, height: 4),
              Row(
                children: [
                  const SpaceWidget(width: 4, height: 0),
                  Textwidget(
                    text: widget.validationText,
                    fontSize: 14,
                    fontSpacing: 0,
                    fontHeight: 1.6,
                    fontWeight: FontWeight.w400,
                    fontColor: UiColor.red,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    return wg1;
  }
}
