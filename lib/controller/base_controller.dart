import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  final GetStorage storage = GetStorage();

  void showToast(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
  }

  void showToastLong(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }
}
