import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/BackGroundWidget.dart';
import 'package:gypool/Widget/ButoonWidget.dart';
import 'package:gypool/Widget/InputValidationWidget.dart';
import 'package:gypool/Widget/SelectWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/common/utils.dart';
import 'package:gypool/constants/constants.dart';
import 'package:gypool/screen/popup/Alert.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isAlert = false;

  int genderIndex = 0; // 0: 남자, 1: 여자
  int classIndex = 0; // 교구 51, 52, 53, 54

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
    bool isNumber,
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
          keyboardType: isPassword
              ? 'password'
              : isNumber
              ? 'number2'
              : 'text',
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

  Widget slideSelectWidget(
    List<String> items,
    String value,
    String lable,
    Function(String?)? onChanged,
  ) {
    return SelectWidget(
      items: items,
      value: value,
      lable: lable,
      onChanged: onChanged,
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
      bodyChild: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SpaceWidget(width: 0, height: 70),
              inputWidget(
                idController,
                '아이디',
                '아이디를 입력해주세요',
                false,
                false,
                (value) {
                  if (idController.text == "") {
                    isIdValid = true;
                    idValidationText = '아이디를 입력해주세요.';
                  } else {
                    // 영문 + 숫자만 허용
                    final RegExp alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
                    if (!alphanumeric.hasMatch(idController.text)) {
                      isIdValid = true;
                      idValidationText = '아이디는 영문과 숫자만 사용 가능합니다.';
                    } else {
                      isIdValid = false;
                      idValidationText = '';
                    }
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
                false,
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
                      if (!PasswordValidator.isValidPassword(
                        pwController.text,
                      )) {
                        isPwValid = true;
                        pwValidationText =
                            PasswordValidator.getMissingRequirements(
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
              inputWidget(
                pwCheckController,
                '비밀번호 확인',
                '비밀번호를 다시 입력해주세요',
                true,
                false,
                (value) {
                  if (pwCheckController.text == "") {
                    isPwCheckValid = true;
                    pwCheckValidationText = '비밀번호 확인을 입력해주세요.';
                  } else {
                    if (pwCheckController.text != pwController.text) {
                      isPwCheckValid = true;
                      pwCheckValidationText = '비밀번호가 일치하지 않습니다.';
                    } else {
                      isPwCheckValid = false;
                      pwCheckValidationText = '';
                    }
                  }
                  setState(() {});
                },
                pwCheckValidationText,
                isPwCheckValid,
                false,
              ),
              inputWidget(
                nameController,
                '이름',
                '이름을 입력해주세요',
                false,
                false,
                (value) {
                  if (nameController.text == "") {
                    isNameValid = true;
                    nameValidationText = '이름을 입력해주세요.';
                  } else {
                    isNameValid = false;
                    nameValidationText = '';
                  }
                  setState(() {});
                },
                nameValidationText,
                isNameValid,
                false,
              ),
              inputWidget(
                phoneController,
                '전화번호',
                '010-0000-0000(-없이 입력)',
                false,
                true,
                (value) {
                  // 숫자가 아닌 문자 제거
                  String numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');

                  // 11자리 제한
                  if (numericValue.length > 11) {
                    numericValue = numericValue.substring(0, 11);
                  }

                  if (phoneController.text != numericValue) {
                    phoneController.text = numericValue;
                    phoneController.selection = TextSelection.fromPosition(
                      TextPosition(offset: numericValue.length),
                    );
                  }

                  if (numericValue.isEmpty) {
                    isPhoneValid = true;
                    phoneValidationText = '전화번호를 입력해주세요.';
                  } else if (numericValue.length < 10) {
                    isPhoneValid = true;
                    phoneValidationText = '전화번호를 입력해주세요.';
                  } else {
                    isPhoneValid = false;
                    phoneValidationText = '';
                  }
                  setState(() {});
                },
                phoneValidationText,
                isPhoneValid,
                false,
              ),
              slideSelectWidget(
                ['남자', '여자'],
                genderIndex == 0 ? '남자' : '여자',
                '성별',
                (value) {
                  setState(() {
                    genderIndex = value == '남자' ? 0 : 1;
                  });
                },
              ),
              SpaceWidget(width: 0, height: 20),
              slideSelectWidget(
                ['51교구', '52교구', '53교구', '54교구'],
                ['51교구', '52교구', '53교구', '54교구'][classIndex],
                '교구',
                (value) {
                  setState(() {
                    classIndex = [
                      '51교구',
                      '52교구',
                      '53교구',
                      '54교구',
                    ].indexOf(value!);
                  });
                },
              ),
              SpaceWidget(width: 0, height: 120),
            ],
          ),
        ),
      ),
      footerChild: Container(
        width: ScreenUtil.screenWidth,
        decoration: BoxDecoration(
          color: UiColor.background,
          boxShadow: [
            BoxShadow(
              color: UiColor.black10Per,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: ButtonWidget(
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color:
                  (!isIdValid &&
                      !isPwValid &&
                      !isPwCheckValid &&
                      !isNameValid &&
                      !isPhoneValid &&
                      idController.text.isNotEmpty &&
                      pwController.text.isNotEmpty &&
                      pwCheckController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty)
                  ? UiColor.primary
                  : UiColor.textSub,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '회원가입',
                style: TextStyle(
                  color: UiColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          onTap: () async {
            // 버튼 활성화 조건 체크
            if (isIdValid ||
                isPwValid ||
                isPwCheckValid ||
                isNameValid ||
                isPhoneValid ||
                idController.text.isEmpty ||
                pwController.text.isEmpty ||
                pwCheckController.text.isEmpty ||
                nameController.text.isEmpty ||
                phoneController.text.isEmpty) {
              return;
            }

            // 모든 조건 통과시 회원가입 진행
            setState(() {
              isAlert = true;
            });
          },
        ),
      ),
      isAlert: isAlert,
      alertBackgroundColor: UiColor.black40Per,
      alertChild: Alert(
        type: 1,
        title: '회원가입 완료',
        message: '회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.',
        closeFunction: () {
          setState(() {
            isAlert = false;
          });
        },
        buttonText2: '취소',

        buttonFunction2: () {
          setState(() {
            isAlert = false;
          });
        },
        buttonText1: '확인',
        buttonFunction1: () {
          setState(() {
            Navigator.pushReplacementNamed(context, "/$PAGE_HOME_PAGE");
          });
        },
      ),
    );
  }
}
