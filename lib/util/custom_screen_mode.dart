import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/app_color.dart';
import 'base_util.dart';


class CustomScreenMode extends BaseUtil {
  final key = "isLight";

  RxBool isLight = true.obs;

  final ThemeData _lightTheme = ThemeData(
    primarySwatch: AppColor.mainColorLight,
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.buttonColorLight,
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    primarySwatch: AppColor.mainColorDark,
    brightness: Brightness.dark,
  );

  ThemeData getThemeData(bool isLight) {
    return isLight ? _lightTheme : _darkTheme;
  }

  /// 기존에 입력해놓은 테마 변수 가져오기
  Future<void> initTheme() async {
    bool? value = storage.read(key);
    value ??= isLight.value;
    await changeTheme(value);
  }


  Future<void> changeTheme(bool value) async {
    isLight.value = value;
    await storage.write(key, value);
  }
}
