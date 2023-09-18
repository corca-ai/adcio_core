abstract class AdcioCoreInterface {
  String get deviceId;
  set deviceId(String id);

  String get sessionId;
  set sessionId(String id);

  String get clientId;

  String get storeId;

  Future<void> initializeApp(String clientId);
}
