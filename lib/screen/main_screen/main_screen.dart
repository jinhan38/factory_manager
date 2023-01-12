import 'package:factory_manager/util/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/locale_controller.dart';
import '../../controller/theme_controller.dart';
import '../../route/route_page.dart';
import '../../util/custom_confirm_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final TextEditingController _idController = TextEditingController();
  late final TextEditingController _pwController = TextEditingController();

  final List<String> _factoryListEn = [
    "Select factory",
    "factory A",
    "factory B",
    "factory C",
    "factory D",
  ];

  final List<String> _factoryList = [
    "공장 선택",
    "공장 A",
    "공장 B",
    "공장 C",
    "공장 D",
  ];

  final List<String> _placeListEn = [
    "Select place",
    "place A",
    "place B",
    "place C",
    "place D",
    "place E",
    "place F",
    "place G",
    "place H",
  ];

  final List<String> _placeList = [
    "위치 선택",
    "위치 A",
    "위치 B",
    "위치 C",
    "위치 D",
    "위치 E",
    "위치 F",
    "위치 G",
    "위치 H",
  ];

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("startScreen".tr),
          actions: [
            IconButton(
                onPressed: () {
                  RoutePage.move(RoutePage.settingScreen);
                },
                icon: const Icon(Icons.settings)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                /// 아이디 입력
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(hintText: 'idHint'.tr),
                ),
                const SizedBox(height: 10),

                /// 비밀번호 입력
                TextFormField(
                  controller: _pwController,
                  decoration: InputDecoration(hintText: 'pwHint'.tr),
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                /// 공장, 위치 선택
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      /// 공장 선택
                      Expanded(
                        child: _inputBox(
                          LocaleController.to.currentLocale ==
                                  LocaleList.ko.value
                              ? _factoryList
                              : _factoryListEn,
                        ),
                      ),

                      const SizedBox(width: 20),

                      /// 위치 선택
                      Expanded(
                        child: _inputBox(
                          LocaleController.to.currentLocale ==
                                  LocaleList.ko.value
                              ? _placeList
                              : _placeListEn,
                        ),
                      ),
                    ],
                  ),
                ),

                /// 로그인 버튼
                ElevatedButton(
                  onPressed: () {
                    RoutePage.move(RoutePage.inputProductInformationScreen);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "login".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                /// 종료 버튼
                ElevatedButton(
                  onPressed: () async {
                    bool? result = await Get.dialog(
                      CustomConfirmDialog(description: "quitDescription".tr),
                      barrierDismissible: false,
                    );
                    if (result != null && result) {
                      SystemNavigator.pop();
                    }
                  },
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "quit".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputBox(List<String> dataList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropDownWidget.show(
        items: dataList,
        initValue: dataList[0],
        isLight: ThemeController.to.screenMode.isLight.value,
        select: (select) {},
      ),
    );
  }
}
