import 'dart:io';

import 'package:adcio_core/src/adcio_core_interface.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

import 'error.dart';

class AdcioCore implements AdcioCoreInterface {
  static final AdcioCore _instance = AdcioCore._();

  static AdcioCore get instance => _instance;

  AdcioCore._();

  static String? _deviceId;
  static String? _sessionId;
  static late String _clientId;
  static bool _isInitialized = false;

  @override
  String get deviceId {
    if (!_isInitialized) throw UnInitializedException();
    return _deviceId!;
  }

  @override
  set deviceId(String id) {
    _deviceId = id;
  }

  @override
  String get sessionId {
    if (!_isInitialized) throw UnInitializedException();
    return _sessionId!;
  }

  @override
  set sessionId(String id) {
    _sessionId = id;
  }

  @override
  String get clientId {
    if (!_isInitialized) throw UnInitializedException();
    return _clientId;
  }

  @override
  String get storeId {
    if (!_isInitialized) throw UnInitializedException();
    return _clientId;
  }

  @override
  Future<void> initializeApp(String clientId) async {
    _clientId = clientId;
    _deviceId = await _fetchDeviceId();
    _sessionId = const Uuid().v4();
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
