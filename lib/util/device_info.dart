import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> getInfo() async {
    return await _deviceInfo.androidInfo;
  }
}
