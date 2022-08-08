import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const extraBoldTitle = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w800,
      fontSize: 22,
      color: AppColorTheme.mainColor);
  static const bold = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColorTheme.black);
  static const boldMain = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColorTheme.mainColor);
  static const boldMain18 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: AppColorTheme.mainColor);
  static const boldGray18 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: AppColorTheme.grey);
  static const boldWhite14 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: AppColorTheme.white);
  static const boldSmallGrey = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: AppColorTheme.grey);

  static const regularGrey = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColorTheme.grey);
  static const regular = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: AppColorTheme.black);
  static const regularUnder = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: AppColorTheme.black,
      decoration: TextDecoration.underline,
      decorationColor: AppColorTheme.mainColor);
  static const regularSmall = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColorTheme.black);
  static const regularWhite12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColorTheme.white);

  static const semiboldMain = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: AppColorTheme.mainColor);
  static const semiboldMain20 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: AppColorTheme.mainColor);
  static const semiboldWhite22 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: AppColorTheme.white);
  static const semiboldGrey16 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColorTheme.grey);

  static const medium = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: AppColorTheme.black);
  static const medium16 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColorTheme.black);
  static const mediumSmallGrey = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColorTheme.grey);
  static const mediumGrey = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColorTheme.grey);
  static const mediumWhite = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColorTheme.white);

  static const verySmall = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: AppColorTheme.mainColor);

  static const small = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColorTheme.mainColor);

  static const regularBlack = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColorTheme.black);
  static const regularBlackUnder = TextStyle(
    fontFamily: "Pretendard",
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColorTheme.black,
    decoration: TextDecoration.underline,
    decorationColor: AppColorTheme.mainColor,
  );

  static const big = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: AppColorTheme.mainColor);

  static const main = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.bold,
      fontSize: 40,
      color: AppColorTheme.mainColor);
}
