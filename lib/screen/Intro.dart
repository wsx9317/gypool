import 'package:flutter/material.dart';
import 'package:gypool/Model/ImagePath.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/BackGroundWidget.dart';
import 'package:gypool/Widget/ButoonWidget.dart';
import 'package:gypool/Widget/LocalImgWidget.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/Widget/TextWidget.dart';
import 'package:gypool/common/utils.dart';
import 'package:gypool/constants/constants.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      bodyChild: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            //배경
            LocalImgWidget(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight,
              assetPath: Imagepath.introBackground,
              boxFit: BoxFit.cover,
            ),
            //텍스트
            Positioned(
              top: ScreenUtil.screenHeight * 0.4,
              child: Column(
                children: [
                  SizedBox(
                    width: ScreenUtil.screenWidth,
                    child: Center(
                      child: Textwidget(
                        text: '광염 카플',
                        fontSize: 35,
                        fontSpacing: 0,
                        fontHeight: 1,
                        fontWeight: FontWeight.w700,
                        fontColor: UiColor.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SpaceWidget(width: 0, height: ScreenUtil.screenHeight * 0.04),
                  SizedBox(
                    width: ScreenUtil.screenWidth,
                    child: Center(
                      child: Textwidget(
                        text: '수렵회 카플을 손쉽게 함께해요',
                        fontSize: 18,
                        fontSpacing: 0,
                        fontHeight: 1,
                        fontWeight: FontWeight.w500,
                        fontColor: UiColor.textSub,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //버튼
            Positioned(
              top: ScreenUtil.screenHeight * 0.57,
              child: ButoonWidget(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/$PAGE_LOGIN_PAGE");
                },
                child: Container(
                  width: ScreenUtil.screenWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: UiColor.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "시작하기",
                        style: TextStyle(
                          color: UiColor.white100per,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //이미지
            Positioned(
              bottom: 0,
              right: 0,
              child: LocalImgWidget(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenWidth * 0.6,
                assetPath: Imagepath.introImg,
                boxFit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: UiColor.background,
      footerChild: SizedBox(),
    );
  }
}
