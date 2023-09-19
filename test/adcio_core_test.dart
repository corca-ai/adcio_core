import 'package:adcio_core/adcio_core.dart';
import 'package:adcio_core/src/adcio_core_interface.dart';
import 'package:adcio_core/src/error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'adcio_core_mock.dart';

void main() async {
  test(
      'Exception when requesting getter before calling initializeApp function.',
      () {
    // define
    AdcioCoreInterface fakeInitTestAdcioCore = FakeAdcioCore();

    // action
    expect(
      () => fakeInitTestAdcioCore.clientId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => fakeInitTestAdcioCore.storeId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => fakeInitTestAdcioCore.sessionId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => fakeInitTestAdcioCore.deviceId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
  });

  test('A code case that works normally.', () {
    // define
    const String sampleClientId = "djfmdje-djnfjd-qldmf";
    AdcioCoreInterface fakeSuccessTestAdcioCore = FakeAdcioCore();

    // set
    fakeSuccessTestAdcioCore.initializeApp(sampleClientId);

    // action
    expect(fakeSuccessTestAdcioCore.clientId, sampleClientId);
    expect(fakeSuccessTestAdcioCore.deviceId,
        "6D79D039-3FE3-4887-B0BC-FDDCBD758C99");
    expect(fakeSuccessTestAdcioCore.sessionId,
        "a3e0efcc-bbed-4c73-b001-cd3d0c54e7a6");
    expect(fakeSuccessTestAdcioCore.storeId, sampleClientId);
  });

  test('clientId and storeId must always be the same.', () {
    // define
    const String sampleClientId = "djfmdje-djnfjd-qldmf";
    AdcioCoreInterface fakeClientStoreIdTestAdcioCore = FakeAdcioCore();

    // set
    fakeClientStoreIdTestAdcioCore.initializeApp(sampleClientId);

    // action
    expect(fakeClientStoreIdTestAdcioCore.clientId,
        fakeClientStoreIdTestAdcioCore.storeId);
  });

  test('sessionId must always be constant during runtime.', () {
    // define
    AdcioCoreInterface fakeSessionTestAdcioCore = FakeAdcioCore();
    fakeSessionTestAdcioCore.initializeApp("Sample Client ID");
    final List<String> sessionIds = [];

    // set
    for (int i = 0; i < 10; i++) {
      sessionIds.add(fakeSessionTestAdcioCore.sessionId);
    }

    // action
    for (int i = 1; i < 10; i++) {
      expect(sessionIds[i - 1], sessionIds[i]);
    }
  });

  test('Error when requesting setter before calling initializeApp function.',
      () {
    // define
    AdcioCoreInterface fakeSetInitTestAdcioCore = FakeAdcioCore();
    const String sampleDeviceId = "fjenxje-dnfbd-djend0-dndnew";
    const String sampleSessionId = "djen-dnms-denc-nehj-mqmdjx";

    // action
    expect(
      () => fakeSetInitTestAdcioCore.deviceId = sampleDeviceId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
    expect(
      () => fakeSetInitTestAdcioCore.sessionId = sampleSessionId,
      throwsA(isInstanceOf<UnInitializedException>()),
    );
  });

  test('change the value using the setter', () {
    // define
    const String sampleClientId = "djfmdje-djnfjd-qldmf";
    const String sampleDeviceId = "fjenxje-dnfbd-djend0-dndnew";
    const String sampleSessionId = "djen-dnms-denc-nehj-mqmdjx";

    AdcioCoreInterface fakeSetterTestAdcioCore = FakeAdcioCore();

    // set
    fakeSetterTestAdcioCore.initializeApp(sampleClientId);
    fakeSetterTestAdcioCore.deviceId = sampleDeviceId;
    fakeSetterTestAdcioCore.sessionId = sampleSessionId;

    // action
    expect(fakeSetterTestAdcioCore.deviceId, sampleDeviceId);
    expect(fakeSetterTestAdcioCore.sessionId, sampleSessionId);
  });
}
