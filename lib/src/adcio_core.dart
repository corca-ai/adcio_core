import 'dart:io';

import 'package:adcio_core/src/adcio_core_interface.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

import 'error.dart';

class AdcioCore implements AdcioCoreInterface {
  AdcioCore._();
  static final AdcioCore _instance = AdcioCore._();

  factory AdcioCore() {
    return _instance;
  }

  static String? _deviceId;
  static String? _sessionId;
  static late String _clientId;
  static bool _isInitialized = false;

  /// deviceId's getter.
  /// ```dart
  /// String deviceId = AdcioCore().deviceId;
  /// ```
  @override
  String get deviceId {
    if (!_isInitialized) throw UnInitializedException();
    return _deviceId!;
  }

  /// deviceId's setter.
  /// ```dart
  /// AdcioCore().deviceid = "set device id";
  /// ```
  @override
  set deviceId(String id) {
    if (!_isInitialized) throw UnInitializedException();
    _deviceId = id;
  }

  /// sessionId's getter.
  /// ```dart
  /// String sessionId = AdcioCore().sessionId;
  /// ```
  @override
  String get sessionId {
    if (!_isInitialized) throw UnInitializedException();
    return _sessionId!;
  }

  /// sessionId's setter.
  /// ```dart
  /// AdcioCore().sessionId = "set session id";
  /// ```
  @override
  set sessionId(String id) {
    if (!_isInitialized) throw UnInitializedException();
    _sessionId = id;
  }

  /// clientId's getter.
  /// clientId is initialized with the value entered as a parameter while you call the initializeApp() function.
  /// ```dart
  /// String clientId = AdcioCore().clientId;
  /// ```
  @override
  String get clientId {
    if (!_isInitialized) throw UnInitializedException();
    return _clientId;
  }

  /// storeId's getter.
  /// storeId has the same value as clientId.
  /// ```dart
  /// String storeId = AdcioCore().storeId;
  /// ```
  @override
  String get storeId {
    if (!_isInitialized) throw UnInitializedException();
    return _clientId;
  }

  /// init ADCIO core values.
  /// this function is so important to use adcio_core function.
  /// Always call this function first.
  /// If you do not call this function, you will be restricted from using all the features in the adcio_core package.
  ///```dart
  /// AdcioCore().initializeApp("...");
  /// ```
  /// this function return `Future<void>`.
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
