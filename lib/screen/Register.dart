import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/BackGroundWidget.dart';
import 'package:gypool/Widget/InputValidationWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/common/utils.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int genderIndex = 0; // 0: 남자, 1: 여자
  int classIndex = 0; // 교구 51, 52, 53, 54
  int levelIndex = 0; // 10: admin, 9: 목사님, 8: 전도사님/장로님/집사님/권사님, 1: 일반회원

  //각 인풋에 필요한  유효성 검사 변수들
  String idValidationText = '';
  String pwValidationText = '';
  String pwCheckValidationText = '';
  String nameValidationText = '';
  String phoneValidationText = '';
  bool isIdValid = false;
  bool isPwValid = false;
  bool isPwCheckValid = false;
  bool isNameValid = false;
  bool isPhoneValid = false;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwCheckController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    pwCheckController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Widget inputWidget(
    TextEditingController controller,
    String lable,
    String hintText,
    bool isPassword,
    Function(String)? onChange,
    String validationText,
    bool validationVisible,
    bool vlaidationCheck,
  ) {
    return Column(
      children: [
        InputValidationWidget(
          controller: controller,
          width: double.infinity,
          height: 48,
          verticalPadding: 8,
          horizontalPadding: 15,
          textColor: UiColor.textMain,
          inputColor: UiColor.white,
          borderColor: UiColor.black20Per,
          activeColor: UiColor.textMain,
          onChange: onChange,
          round: 8,
          textAlign: "start",
          hintText: hintText,
          hintTextFontSize: 16,
          hintTextfontWeight: FontWeight.w400,
          hintTextFontColor: UiColor.placeholder,
          keyboardType: isPassword ? 'password' : 'text',
          showSearchIcon: false,
          validationText: validationText,
          validationVisible: validationVisible,
          lable: lable,
          vlaidationCheck: vlaidationCheck,
          enabledBool: true,
        ),
        SpaceWidget(width: 0, height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      horizontalPadding: 20,
      backgroundColor: UiColor.background,
      appBar: Container(
        width: ScreenUtil.screenWidth,
        height: 56,
        color: UiColor.primary,
        child: Center(
          child: Text(
            '회원가입',
            style: TextStyle(
              color: UiColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      bodyChild: Column(
        children: [
          SpaceWidget(width: 0, height: 100),
          inputWidget(
            idController,
            '아이디',
            '아이디를 입력해주세요',
            false,
            (value) {
              if (idController.text == "") {
                isIdValid = true;
                idValidationText = '아이디를 입력해주세요.';
              } else {
                isIdValid = false;
                idValidationText = '';
              }
              setState(() {});
            },
            idValidationText,
            isIdValid,
            false,
          ),
          inputWidget(
            pwController,
            '비밀번호',
            '비밀번호를 입력해주세요',
            true,
            (value) {
              if (pwController.text == "") {
                isPwValid = true;
                pwValidationText = '비밀번호를 입력해주세요.';
              } else {
                if (pwController.text.length < 8) {
                  isPwValid = true;
                  pwValidationText = '비밀번호는 8자리 이상이어야 합니다.';
                } else {
                  // 대소문자 + 숫자 + 특수문자 검증
                  if (!PasswordValidator.isValidPassword(pwController.text)) {
                    isPwValid = true;
                    pwValidationText = PasswordValidator.getMissingRequirements(
                      pwController.text,
                    );
                  } else {
                    isPwValid = false;
                    pwValidationText = '';
                  }
                }
              }
              setState(() {});
            },
            pwValidationText,
            isPwValid,
            false,
          ),
        ],
      ),
      footerChild: SizedBox(),
    );
  }
}
