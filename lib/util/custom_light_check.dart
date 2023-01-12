import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:light/light.dart';

import '../controller/theme_controller.dart';
import 'base_util.dart';

/// 조도 체크
class CustomLightCheck extends BaseUtil {
  static const String storageKey = "enableLightCheck";
  Light? _light;
  StreamSubscription? _subscription;
  final RxInt valueNotifier = 0.obs;
  RxBool enable = false.obs;
  bool isDelay = false;

  StreamSubscription? get subscription => _subscription;

  void change() async {
    enable.value = !enable.value;
    await storage.write(storageKey, enable.value);
    if (enable.value) {
      if (_light == null) {
        await initPlatformState();
      }
    } else {
      stopListening();
    }
  }

  Future<void> initPlatformState() async {
    bool? storageEnable = storage.read(storageKey);
    if (storageEnable == null || !storageEnable) {
      enable.value = false;
      return;
    }
    enable.value = true;
    _light ??= Light();
    try {
      _subscription = _light!.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      log(exception.toString());
    }
  }

  void onData(int value) async {
    if (!enable.value) return;
    if (isDelay) return;
    valueNotifier.value = value;
    double brightness = ThemeController.to.customBrightness.brightness;
    if (value < 100 && brightness != 0.3) {
      changeDelay(0.3);
    } else if (value >= 2000 && brightness != 1) {
      changeDelay(1);
    } else if (value < 2000 && value >= 1000 && brightness != 0.8) {
      changeDelay(0.8);
    } else if (value < 1000 && value >= 100 && brightness != 0.6) {
      changeDelay(0.6);
    }
  }

  Future<void> changeDelay(double brightness, {bool needDelay = false}) async {
    isDelay = true;
    if (needDelay) {
      await Future.delayed(const Duration(milliseconds: 600));
    }
    if (ThemeController.to.customBrightness.brightness != brightness) {
      ThemeController.to.customBrightness.changeBrightness(brightness);
    }
    isDelay = false;
  }

  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
    _light = null;
  }
}
