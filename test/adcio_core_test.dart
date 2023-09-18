@GenerateNiceMocks([MockSpec<AdcioCore>()])
import 'package:adcio_core/src/adcio_core.dart';

import 'package:adcio_core/adcio_core.dart';
import 'package:adcio_core/src/adcio_core_interface.dart';
import 'package:adcio_core/src/error.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'adcio_core_mock.dart';

void main() async {
  test('session id is all same value in runtime!', () {
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

  test('do not call init function and get some field', () {
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

  test('success safe case', () {
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
}
