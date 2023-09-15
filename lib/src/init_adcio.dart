import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

class AdcioCore {
  AdcioCore._();

  static String? _deviceId;
  static String? _sessionId;
  static late String _clientId;
  static bool _isInitialized = false;

  static Future<String> get deviceId async {
    _deviceId ??= await _fetchDeviceId();
    return _deviceId!;
  }

  static set deivceId(String id) {
    _deviceId = id;
  }

  static String get sessionId {
    _sessionId ??= const Uuid().v4();
    return _sessionId!;
  }

  static set sessionId(String id) {
    _sessionId = id;
  }

  static String get clientId {
    assert(_isInitialized);
    return _clientId;
  }

  static String get storeId {
    return _clientId;
  }

  static void initializeApp(String clientId) {
    _clientId = clientId;
    _isInitialized = true;
  }

  static Future<String> _fetchDeviceId() async {
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
}
