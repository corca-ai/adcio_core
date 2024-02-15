@GenerateNiceMocks([MockSpec<FetchDeviceId>()])
import 'package:adcio_core/src/fetch_device_id.dart';
import 'package:adcio_core/src/session_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adcio_core_test.mocks.dart';

void main() async {
  final FetchDeviceId fetchDeviceId = MockFetchDeviceId();

  setUp(() {
    when(
      fetchDeviceId.call(),
    ).thenAnswer(
      (_) async => "DEVICE_UNIQUE_ID",
    );
  });

  test('A code case that works normally.', () async {
    final String deviceId = await fetchDeviceId();
    final String sessionId = SessionClient().loadSessionId();

    // action
    expect("DEVICE_UNIQUE_ID", deviceId);
    expect(SessionClient().loadSessionId(), sessionId);
  });

  test('Verifying if the sessionId remains the same during runtime', () async {
    // verify1
    final sessionId = SessionClient().loadSessionId();
    expect(sessionId, SessionClient().loadSessionId());

    // verify2
    Future.delayed(const Duration(seconds: 2));
    expect(sessionId, SessionClient().loadSessionId());
  });
}
