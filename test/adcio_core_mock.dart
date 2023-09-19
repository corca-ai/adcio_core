import 'package:adcio_core/src/adcio_core_interface.dart';
import 'package:adcio_core/src/error.dart';

class FakeAdcioCore implements AdcioCoreInterface {
  String _deviceId = "6D79D039-3FE3-4887-B0BC-FDDCBD758C99";
  String _sessionId = "a3e0efcc-bbed-4c73-b001-cd3d0c54e7a6";
  late String _clientId;
  bool _isInitialized = false;

  @override
  String get deviceId {
    if (!_isInitialized) throw UnInitializedException();
    return _deviceId;
  }

  @override
  set deviceId(String id) {
    if (!_isInitialized) throw UnInitializedException();
    _deviceId = id;
  }

  @override
  String get sessionId {
    if (!_isInitialized) throw UnInitializedException();
    return _sessionId;
  }

  @override
  set sessionId(String id) {
    if (!_isInitialized) throw UnInitializedException();
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
    _isInitialized = true;
  }
}
