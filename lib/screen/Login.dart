import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/BackGroundWidget.dart';
import 'package:gypool/Widget/ButoonWidget.dart';
import 'package:gypool/Widget/InputValidationWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/common/utils.dart';
import 'package:gypool/constants/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAlertShow = false;
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

  Widget inputWidget(
    TextEditingController controller,
    String hintText,
    bool isPassword,
  ) {
    return InputValidationWidget(
      controller: controller,
      width: double.infinity,
      height: 48,
      verticalPadding: 8,
      horizontalPadding: 15,
      textColor: UiColor.textMain,
      inputColor: UiColor.white,
      borderColor: UiColor.black20Per,
      activeColor: UiColor.textMain,
      round: 8,
      textAlign: "start",
      hintText: hintText,
      hintTextFontSize: 16,
      hintTextfontWeight: FontWeight.w400,
      hintTextFontColor: UiColor.placeholder,
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
            style: TextStyle(
              color: UiColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      horizontalPadding: 20,
      bodyChild: SizedBox(
        child: Column(
          children: [
            SpaceWidget(width: 0, height: ScreenUtil.screenHeight * 0.4),
            inputWidget(idController, '아이디를 입력하세요', false),
            SpaceWidget(width: 0, height: 30),
            inputWidget(pwController, '비밀번호를 입력하세요', true),
            SpaceWidget(width: 0, height: 30),
            ButtonWidget(
              onTap: () async {
                setState(() {
                  isAlertShow = true;
                });
                // Navigator.pushReplacementNamed(context, "/$PAGE_HOME_PAGE");
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: UiColor.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "로그인",
                    style: TextStyle(
                      color: UiColor.white100per,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: UiColor.background,
      footerChild: SizedBox(),
      isAlert: isAlertShow,
      alertBackgroundColor: UiColor.black30Per,
      alertChild: SizedBox(),
    );
  }
}
