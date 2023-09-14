import 'adcio_device_info.dart';

AdcioDeviceInfo adcioInfo = AdcioDeviceInfo();

String getSessionId([AdcioDeviceInfo? otherInfo]) =>
    (otherInfo == null) ? adcioInfo.getSessionId() : otherInfo.getSessionId();

Future<String> getDeviceId([AdcioDeviceInfo? info]) =>
    (info == null) ? adcioInfo.getDeviceId() : info.getDeviceId();

class AdcioCore {
  AdcioCore._();

  static late String _clientId;
  static bool _isInitialized = false;

  static String get clientId {
    assert(_isInitialized);
    return _clientId;
  }

  static void init(String clientId) {
    _clientId = clientId;
    _isInitialized = true;
  }
}
