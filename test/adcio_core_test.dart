@GenerateNiceMocks([MockSpec<DeviceIdentifier>()])
import 'package:adcio_core/src/device_identifier.dart';
import 'package:adcio_core/src/session_identifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adcio_core_test.mocks.dart';

void main() async {
  final DeviceIdentifier fetchDeviceId = MockDeviceIdentifier();

  setUp(() {
    when(
      fetchDeviceId.loadId(),
    ).thenAnswer(
      (_) async => "DEVICE_UNIQUE_ID",
    );
  });

  test('A code case that works normally.', () async {
    final String deviceId = await fetchDeviceId.loadId();
    final String sessionId = SessionIdentifier().loadId();

    // action
    expect("DEVICE_UNIQUE_ID", deviceId);
    expect(SessionIdentifier().loadId(), sessionId);
  });

  test('Verifying if the sessionId remains the same during runtime', () async {
    // verify1
    final sessionId = SessionIdentifier().loadId();
    expect(sessionId, SessionIdentifier().loadId());

    // verify2
    Future.delayed(const Duration(seconds: 2));
    expect(sessionId, SessionIdentifier().loadId());
  });
}
