import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

import 'error.dart';

class AdcioCore {
  AdcioCore._();

  static bool _isInitialized = false;

  static String? _deviceId;
  static String? _sessionId;
  static late String _storeId;
  static late String _clientId;

  /// deviceId's getter.
  /// ```dart
  /// String deviceId = AdcioCore.deviceId;
  /// ```
  static String get deviceId {
    if (!_isInitialized) throw UnInitializedException();
    return _deviceId!;
  }

  /// deviceId's setter.
  /// ```dart
  /// AdcioCore.deviceid = "DEVICE_UNIQUE_ID";
  /// ```
  static set deviceId(String id) {
    if (!_isInitialized) throw UnInitializedException();
    _deviceId = id;
  }

  /// sessionId's getter.
  /// ```dart
  /// String sessionId = AdcioCore.sessionId;
  /// ```
  static String get sessionId {
    if (!_isInitialized) throw UnInitializedException();
    return _sessionId!;
  }

  /// sessionId's setter.
  /// ```dart
  /// AdcioCore.sessionId = "RUNTIME_SESSION_ID";
  /// ```
  static set sessionId(String id) {
    if (!_isInitialized) throw UnInitializedException();
    _sessionId = id;
  }

  /// clientId's getter.
  /// clientId is initialized with the value entered as a parameter while you call the initializeApp() function.
  /// ```dart
  /// String clientId = AdcioCore.clientId;
  /// ```
  static String get clientId {
    if (!_isInitialized) throw UnInitializedException();
    return _clientId;
  }

  /// sessionId's setter.
  /// ```dart
  /// AdcioCore.storeId = "ADCIO_STORE_ID";
  /// ```
  static set storeId(String id) {
    if (!_isInitialized) throw UnInitializedException();
    _storeId = id;
  }

  /// storeId's getter.
  /// storeId has the same value as clientId.
  /// ```dart
  /// String storeId = AdcioCore.storeId;
  /// ```
  static String get storeId {
    if (!_isInitialized) throw UnInitializedException();
    return _storeId;
  }

  /// init ADCIO core values.
  /// this function is so important to use adcio_core function.
  /// Always call this function first.
  /// If you do not call this function, you will be restricted from using all the features in the adcio_core package.
  ///
  /// ```dart
  /// AdcioCore.initializeApp(clientId: 'ADCIO_STORE_ID');
  /// ```
  ///
  /// this function return `Future<void>`.
  static Future<void> initializeApp({required String clientId}) async {
    _clientId = clientId;
    _storeId = _clientId;
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
