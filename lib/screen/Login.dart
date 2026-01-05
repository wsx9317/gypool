import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/BackGroundWidget.dart';
import 'package:gypool/Widget/ButoonWidget.dart';
import 'package:gypool/Widget/InputValidationWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/Widget/TextWidget.dart';
import 'package:gypool/common/utils.dart';
import 'package:gypool/constants/constants.dart';
import 'package:gypool/screen/popup/Alert.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAlertShow = true;
  String alertTitle = '';
  String alertMessage = '';
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  void initState() {
    super.initState();
    alertTitle = '로그인 실패';
    alertMessage = '아이디 또는 비밀번호를\n다시 확인해주세요';
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

  Widget textBtn(Function() onTap, String message) {
    return ButtonWidget(
      onTap: onTap,
      child: Textwidget(
        text: message,
        fontSize: 14,
        fontSpacing: 0,
        fontHeight: 1.2,
        fontWeight: FontWeight.w400,
        fontColor: UiColor.primary,
        textAlign: TextAlign.right,
      ),
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
            SpaceWidget(width: 0, height: 15),
            Row(
              children: [
                textBtn(() {}, '아이디 찾기/비밀번호 찾기'),
                const Spacer(),
                textBtn(() {
                  Navigator.pushNamed(context, "/$PAGE_REGISTER_PAGE");
                }, '회원가입'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: UiColor.background,
      footerChild: SizedBox(),
      isAlert: isAlertShow,
      alertBackgroundColor: UiColor.black40Per,
      alertChild: Alert(
        type: 2,
        title: alertTitle,
        message: alertMessage,
        buttonText1: '확인',
        closeFunction: () {
          setState(() {
            isAlertShow = false;
          });
        },
        buttonFunction1: () {
          setState(() {
            isAlertShow = false;
          });
        },
      ),
    );
  }
}
