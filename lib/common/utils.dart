import 'package:flutter/material.dart';

class ScreenUtil {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static Size get screenSize {
    return Size(screenWidth, screenHeight);
  }
}

// 비밀번호 유효성 검사: 대소문자 + 숫자 + 특수문자 포함
class PasswordValidator {
  // 대문자 포함 여부
  static bool hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  // 소문자 포함 여부
  static bool hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  // 숫자 포함 여부
  static bool hasDigit(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  // 특수문자 포함 여부
  static bool hasSpecialChar(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  // 전체 검증 (대소문자 + 숫자 + 특수문자)
  static bool isValidPassword(String password) {
    return hasUpperCase(password) &&
        hasLowerCase(password) &&
        hasDigit(password) &&
        hasSpecialChar(password);
  }

  // 부족한 조건 메시지 반환
  static String getMissingRequirements(String password) {
    List<String> missing = [];

    if (!hasUpperCase(password)) {
      missing.add('대문자');
    }
    if (!hasLowerCase(password)) {
      missing.add('소문자');
    }
    if (!hasDigit(password)) {
      missing.add('숫자');
    }
    if (!hasSpecialChar(password)) {
      missing.add('특수문자');
    }

    if (missing.isEmpty) {
      return '';
    }
    return '${missing.join(', ')}를 포함해야 합니다.';
  }
}
