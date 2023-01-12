import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LocaleList {
  ko("ko"), // 한국어
  en("en"); // 영어

  final String value;

  const LocaleList(this.value);
}

class LocaleController extends GetxController {
  static LocaleController get to => Get.find();

  bool initLocale = false;
  String currentLocale = "ko";

  void changeLocale({required String localeName}) {
    currentLocale = localeName;
    Get.updateLocale(Locale(localeName, ""));
  }

  Locale defaultLocale() {
    if (!initLocale) {
      initLocale = true;
      final String defaultLocale = Platform.localeName;
      if (defaultLocale.contains("en")) {
        currentLocale = LocaleList.en.value;
        return const Locale("en", "");
      }
      currentLocale = LocaleList.ko.value;
    }
    return Locale(currentLocale, "");
  }
}
