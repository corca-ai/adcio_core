import 'package:adcio_core/adcio_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAdcioInfo extends Mock implements AdcioDeviceInfo {}

void main() async {
  final mockAdcioInfo = MockAdcioInfo();

  await AdcioCore.initializeApp(
    'asdfasdf',
    mockAdcioInfo,
  );

  when(mockAdcioInfo.getDeviceId())
      .thenAnswer((_) async => '6D79D039-3FE3-4887-B0BC-FDDCBD758C99');

  when(mockAdcioInfo.getSessionId())
      .thenReturn('a3e0efcc-bbed-4c73-b001-cd3d0c54e7a');

  // setUp(() async {

  // });

  test('get sessionIds performance test', () {
    final List<Duration> durations = [];
    for (int i = 0; i < 10; i++) {
      durations.add(getSessionIdDuration());
    }

    for (int i = 1; i < 10; i++) {
      expect(durations[i - 1], durations[i]);
    }
  });
}

Duration getSessionIdDuration() {
  final stopwatch = Stopwatch()..start();
  final sessionId = AdcioCore.sessionId;
  stopwatch.stop();

  debugPrint('sessionid: $sessionId executed in ${stopwatch.elapsed}');

  return stopwatch.elapsed;
}
