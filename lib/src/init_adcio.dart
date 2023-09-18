import 'package:adcio_core/src/adcio_device_info.dart';

AdcioDeviceInfo adcioInfo = AdcioDeviceInfo();

class AdcioCore {
  AdcioCore._();

  static String? _deviceId;
  static String? _sessionId;
  static late String _clientId;
  static bool _isInitialized = false;

  static String get deviceId {
    assert(_isInitialized);
    return _deviceId!;
  }

  static set deviceId(String id) {
    _deviceId = id;
  }

  static String get sessionId {
    assert(_isInitialized);
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

  static Future<bool> initializeApp(
    String clientId, [
    AdcioDeviceInfo? otherInfo,
  ]) async {
    final info = otherInfo ?? adcioInfo;

    _clientId = clientId;
    _deviceId = await info.getDeviceId();
    _sessionId = info.getSessionId();
    _isInitialized = true;

    return true;
  }
}
