import 'package:factory_manager/screen/input_product_info_screen/input_product_info_screen.dart';
import 'package:get/get.dart';

import '../controller/base_controller.dart';
import '../screen/main_screen/main_screen.dart';
import '../screen/setting/setting_screen.dart';

class RoutePage {

  static move(String pageName) => Get.toNamed(pageName);

  static moveWithArgument(String pageName, dynamic arguments) =>
      Get.toNamed(pageName, arguments: arguments);

  static Future<dynamic> moveWithArgumentCallBack(
          String pageName, dynamic arguments) async =>
      Get.toNamed(pageName, arguments: arguments);

  ///현재 page 지우고 다음 페이지로 이동
  static offAndToNamed(String pageName, {dynamic argument}) =>
      Get.offAndToNamed(pageName, arguments: argument);

  ///기존에 쌓여있던 모든 stack 지우고 이동하려는 페이지만 stack이 남는다
  static moveOffAllNamed(String pageName) => Get.offAllNamed(pageName);

  ///현재 페이지 닫고, 다음 페이지로 argument 전달하면서 이동
  static offToNameWithArgument(String pageName, {dynamic argument}) =>
      Get.offAndToNamed(pageName, arguments: argument);

  ///현재 페이지 제거하고 입력받은 페이지로 이동
  static off(String pageName) => Get.off(pageName);

  static offAllNamed(String pageName) => Get.offAllNamed(pageName);

  static deleteController<T extends BaseController>() => Get.delete<T>();

  static getBack() => Get.back();

  // static goHome() =>
  //     Get.until((route) => Get.currentRoute == RoutePage.NAVIGATION_ROUTE);

  ///특정 페이지까지 돌아가면서 그 사이에 있는 페이지들은 종료
  static offUntil(String routeName) =>
      Get.until((route) => Get.currentRoute == routeName);

  static const String mainScreen = "/main_screen";
  static const String settingScreen = "/setting_screen";
  static const String inputProductInformationScreen = "/input_product_info_screen";

  static final List<GetPage> pageList = <GetPage>[
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: inputProductInformationScreen,
      page: () => const InputProductInfoScreen(),
    ),
  ];
}
