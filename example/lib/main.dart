// ignore: depend_on_referenced_packages
import 'package:adcio_core/adcio_core.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  TextButton(
                    onPressed: () async {
                      /// You can get the device id through the FetchDeviceId() object.
                      final fetchDeviceId = FetchDeviceId();
                      final String deviceId = await fetchDeviceId();
                      Fluttertoast.showToast(msg: deviceId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.amber,
                    ),
                    child: const Text("get Device Id"),
                  ),
                  TextButton(
                    onPressed: () {
                      /// You can get the session id through the SessionClient() object.
                      final String sessionId = SessionClient().loadSessionId();
                      Fluttertoast.showToast(msg: sessionId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.indigo,
                    ),
                    child: const Text("get Session Id"),
                  ),
                ],
              ),
              const Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('adcio_core plugin example'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
