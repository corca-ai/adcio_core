import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceIdentifier {
  
  static final Future<String> _identifier = _createIdentifier();

  Future<String> get identifier => _identifier;

  static Future<String> _createIdentifier() async {

    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return info.id;
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      return info.identifierForVendor ?? '${DateTime.now()}';
    } else {
      return '${DateTime.now()}';
    }
  }

  Future<String> loadId() {
    return identifier;
  }
}
