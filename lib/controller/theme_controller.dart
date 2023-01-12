import 'package:get/get.dart';

import '../util/custom_brightness.dart';
import '../util/custom_light_check.dart';
import '../util/custom_screen_mode.dart';
import 'base_controller.dart';

class ThemeController extends BaseController {
  static ThemeController get to => Get.find();

  final CustomBrightness customBrightness = CustomBrightness();

  final CustomScreenMode screenMode = CustomScreenMode();

  final CustomLightCheck lightCheck = CustomLightCheck();
}
