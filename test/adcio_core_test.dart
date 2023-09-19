import 'package:adcio_core/adcio_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test(
      'Exception when requesting getter before calling initializeApp function.',
      () {
    // action
    expect(
      () => AdcioCore.clientId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => AdcioCore.storeId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => AdcioCore.sessionId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => AdcioCore.deviceId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
  });

  test('Error when requesting setter before calling initializeApp function.',
      () {
    // define
    const String sampleDeviceId = "6D79D039-3FE3-4887-B0BC-FDDCBD758C99";
    const String sampleSessionId = "a3e0efcc-bbed-4c73-b001-cd3d0c54e7a6";

    // action
    expect(
      () => AdcioCore.deviceId = sampleDeviceId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => AdcioCore.sessionId = sampleSessionId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
  });

  test('A code case that works normally.', () {
    // define
    const String sampleClientId = "djfmdje-djnfjd-qldmf";
    const String sampleDeviceId = "6D79D039-3FE3-4887-B0BC-FDDCBD758C99";
    const String sampleSessionId = "a3e0efcc-bbed-4c73-b001-cd3d0c54e7a6";

    // set
    AdcioCore.initializeApp(
      clientId: sampleClientId,
      deviceId: sampleDeviceId,
      sessionId: sampleSessionId,
    );

    // action
    expect(AdcioCore.clientId, sampleClientId);
    expect(AdcioCore.deviceId, sampleDeviceId);
    expect(AdcioCore.sessionId, sampleSessionId);
    expect(AdcioCore.storeId, sampleClientId);
  });

  test('clientId and storeId must always be the same.', () {
    // define
    const String sampleClientId = "djfmdje-djnfjd-qldmf";
    const String sampleDeviceId = "6D79D039-3FE3-4887-B0BC-FDDCBD758C99";
    const String sampleSessionId = "a3e0efcc-bbed-4c73-b001-cd3d0c54e7a6";

    // set
    AdcioCore.initializeApp(
      clientId: sampleClientId,
      deviceId: sampleDeviceId,
      sessionId: sampleSessionId,
    );

    // action
    expect(AdcioCore.clientId, AdcioCore.storeId);
  });

  test('change the value using the setter', () {
    // define
    const String sampleClientId = "djfmdje-djnfjd-qldmf";
    const String sampleDeviceId = "6D79D039-3FE3-4887-B0BC-FDDCBD758C99";
    const String sampleSessionId = "a3e0efcc-bbed-4c73-b001-cd3d0c54e7a6";

    // set
    AdcioCore.initializeApp(
      clientId: sampleClientId,
      deviceId: sampleDeviceId,
      sessionId: sampleSessionId,
    );

    AdcioCore.deviceId = sampleDeviceId;
    AdcioCore.sessionId = sampleSessionId;

    // action
    expect(AdcioCore.deviceId, sampleDeviceId);
    expect(AdcioCore.sessionId, sampleSessionId);
  });
}
