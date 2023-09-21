import 'package:adcio_core/adcio_core.dart';
@GenerateNiceMocks([MockSpec<FetchDeviceId>()])
import 'package:adcio_core/src/fetch_device_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adcio_core_test.mocks.dart';

void main() async {
  const String sampleClientId = "djfmdje-djnfjd-qldmf";
  final FetchDeviceId fetchDeviceId = MockFetchDeviceId();

  setUp(() {
    when(
      fetchDeviceId.call(),
    ).thenAnswer(
      (_) async => "DEVICE_UNIQUE_ID",
    );
  });

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

  test('A code case that works normally.', () async {
    // set
    await AdcioCore.initializeApp(
      clientId: sampleClientId,
    );

    final deviceId = AdcioCore.deviceId;
    final sessionId = AdcioCore.sessionId;

    // action
    expect(AdcioCore.clientId, sampleClientId);
    expect(AdcioCore.deviceId, deviceId);
    expect(AdcioCore.sessionId, sessionId);
    expect(AdcioCore.storeId, sampleClientId);
  });

  test('clientId and storeId must always be the same.', () async {
    // set
    await AdcioCore.initializeApp(
      clientId: sampleClientId,
    );

    // action
    expect(AdcioCore.clientId, AdcioCore.storeId);
  });

  test('Verifying if the sessionId remains the same during runtime', () async {
    // set
    await AdcioCore.initializeApp(
      clientId: sampleClientId,
    );

    // verify1
    final sessionId = AdcioCore.sessionId;
    expect(sessionId, AdcioCore.sessionId);

    // verify2
    Future.delayed(const Duration(seconds: 2));
    expect(sessionId, AdcioCore.sessionId);
  });

  test('Change the value using the setter', () async {
    // set
    await AdcioCore.initializeApp(
      clientId: sampleClientId,
    );

    final oldSampleDeviceId = AdcioCore.deviceId;
    final oldSampleSessionId = AdcioCore.sessionId;

    // use setter
    const String newSampleDeviceId = "39DJ9DSW-0OKN-9876-NKJ3-POIEJXKFHJE3";
    const String newSampleSessionId = "djendkem-ponk-12f3-adf1-jtrmvu54e7a5";

    AdcioCore.deviceId = newSampleDeviceId;
    AdcioCore.sessionId = newSampleSessionId;

    // action
    expect(AdcioCore.deviceId, isNot(equals(oldSampleDeviceId)));
    expect(AdcioCore.deviceId, equals(newSampleDeviceId));

    expect(AdcioCore.sessionId, isNot(equals(oldSampleSessionId)));
    expect(AdcioCore.sessionId, equals(newSampleSessionId));
  });

  test(
      'SessionId should not change if initializeApp function is called multiple times',
      () async {
    // set
    await AdcioCore.initializeApp(
      clientId: sampleClientId,
    );

    final oldSampleSessionId = AdcioCore.sessionId;

    // use setter
    await AdcioCore.initializeApp(
      clientId: sampleClientId,
    );

    final newSampleSessionId = AdcioCore.sessionId;

    expect(oldSampleSessionId, equals(newSampleSessionId));
  });
}
