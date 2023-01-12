import 'package:factory_manager/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/locale_controller.dart';
import '../../controller/theme_controller.dart';
import '../../util/drop_down_widget.dart';

class InputProductInfoScreen extends StatefulWidget {
  const InputProductInfoScreen({Key? key}) : super(key: key);

  @override
  State<InputProductInfoScreen> createState() => _InputProductInfoScreenState();
}

class _InputProductInfoScreenState extends State<InputProductInfoScreen> {
  final _infoAList = ["정보 A 입력", "a", "b", "c", "d", "e", "f"];
  final _infoBList = ["정보 B 입력", "a", "b", "c", "d", "e", "f"];
  final _infoCList = ["정보 C 입력", "a", "b", "c", "d", "e", "f"];
  final _infoDList = ["정보 D 입력", "a", "b", "c", "d", "e", "f"];
  final _infoEList = ["정보 E 입력", "a", "b", "c", "d", "e", "f"];
  final _infoAListEn = ["input A information", "a", "b", "c", "d", "e", "f"];
  final _infoBListEn = ["input A information", "a", "b", "c", "d", "e", "f"];
  final _infoCListEn = ["input A information", "a", "b", "c", "d", "e", "f"];
  final _infoDListEn = ["input A information", "a", "b", "c", "d", "e", "f"];
  final _infoEListEn = ["input A information", "a", "b", "c", "d", "e", "f"];

  @override
  Widget build(BuildContext context) {
    bool languageKo = LocaleController.to.currentLocale == LocaleList.ko.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("inputInfo".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "inputInfoDescription".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _inputBox(languageKo ? _infoAList : _infoAListEn),
            _inputBox(languageKo ? _infoBList : _infoBListEn),
            _inputBox(languageKo ? _infoCList : _infoCListEn),
            _inputBox(languageKo ? _infoDList : _infoDListEn),
            _inputBox(languageKo ? _infoEList : _infoEListEn),
            const Spacer(),

            ElevatedButton(
              onPressed: () {
                BaseController.to.showToast("finish".tr);
              },
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "finish".tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
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
