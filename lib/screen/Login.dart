import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/BackGroundWidget.dart';
import 'package:gypool/Widget/InputValidationWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/common/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  Widget inputWidget(TextEditingController controller, String hintText, bool isPassword) {
    return InputValidationWidget(
      controller: controller,
      width: double.infinity,
      height: 48,
      verticalPadding: 8,
      horizontalPadding: 15,
      textColor: UiColor.textMain,
      inputColor: UiColor.white,
      borderColor: UiColor.black20Per,
      round: 8,
      textAlign: "start",
      hintText: hintText,
      hintTextFontSize: 16,
      hintTextfontWeight: FontWeight.w400,
      hintTextFontColor: UiColor.textMain,
      keyboardType: isPassword ? 'password' : 'text',
      showSearchIcon: false,
      validationText: '아이디를 확인해주세요',
      validationVisible: false,
      vlaidationCheck: false,
      enabledBool: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: Container(
        width: ScreenUtil.screenWidth,
        height: 56,
        color: UiColor.primary,
        child: Center(
          child: Text(
            '로그인',
            style: TextStyle(color: UiColor.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      horizontalPadding: 20,
      bodyChild: SizedBox(child: Column(children: [SpaceWidget(width: 0, height: 250)])),
      backgroundColor: UiColor.background,
      footerChild: SizedBox(),
    );
  }
}
