import 'package:connectivity/connectivity.dart';

class NetUtils {

  static Future<String> getNetInfo() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      return "移动网络";
    } else if (result == ConnectivityResult.wifi) {
      return "wifi";
    } else {
      return "未知";
    }
  }
}