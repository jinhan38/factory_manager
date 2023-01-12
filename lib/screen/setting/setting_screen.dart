import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../controller/locale_controller.dart';
import '../../controller/theme_controller.dart';
import '../../util/device_info.dart';
import 'widgets/brightness_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final IconData _iconDark = Icons.nights_stay;
  final IconData _iconLight = Icons.wb_sunny;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr),
        actions: [
          IconButton(
              onPressed: () {
                ThemeController.to.screenMode
                    .changeTheme(!ThemeController.to.screenMode.isLight.value);
                setState(() {});
              },
              icon: Icon(ThemeController.to.screenMode.isLight.value
                  ? _iconDark
                  : _iconLight)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              _title("changeScreenLight"),
              const BrightnessWidget(),
              const SizedBox(height: 50),
              _title("selectLang"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        LocaleController.to
                            .changeLocale(localeName: LocaleList.ko.value);
                        setState(() {});
                      },
                      child: const Text("한국어")),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        LocaleController.to
                            .changeLocale(localeName: LocaleList.en.value);
                        setState(() {});
                      },
                      child: const Text("English")),
                ],
              ),
              const SizedBox(height: 10),
              Text("선택된 언어 : ${"language".tr}"),
              const SizedBox(height: 50),
              _title("deviceInfo"),
              FutureBuilder<AndroidDeviceInfo>(
                  future: DeviceInfo().getInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        Text(
                            "기기 안드로이드 OS 버전 : ${snapshot.data!.version.release}"),
                        Text("모델 : ${snapshot.data!.model}"),
                      ],
                    );
                  }),
              FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Text("앱 버전 : ${snapshot.data!.version}");
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            text.tr,
            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
