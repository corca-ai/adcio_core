// ignore: depend_on_referenced_packages
import 'package:adcio_core/adcio_core.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// this is important to call `AdcioCore.initializeApp(clientId: 'ADCIO_STORE_ID')` function.
  await AdcioCore.initializeApp(
      clientId: 'f8f2e298-c168-4412-b82d-98fc5b4a114a');

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
                      /// You can get the device id through the AdcioCore() object.
                      /// Of course, you can also set the device id.
                      /// ```dart
                      /// String deviceId = AdcioCore.deviceId;
                      /// AdcioCore.deviceid = "DEVICE_UNIQUE_ID";
                      /// String deviceId = AdcioCore.deviceId; // result: DEVICE_UNIQUE_ID
                      /// ```

                      final String deviceId = AdcioCore.deviceId;
                      Fluttertoast.showToast(msg: deviceId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.amber,
                    ),
                    child: const Text("get Device Id"),
                  ),
                  TextButton(
                    onPressed: () {
                      /// You can get the session id through the AdcioCore() object.
                      /// Of course, you can also set the session id.
                      /// ```dart
                      /// String sessionId = AdcioCore.sessionId;
                      /// AdcioCore.sessionId = "RUNTIME_SESSION_ID";
                      /// String sessionId = AdcioCore.sessionId; // result: RUNTIME_SESSION_ID
                      /// ```

                      final String sessionId = AdcioCore.sessionId;
                      Fluttertoast.showToast(msg: sessionId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.indigo,
                    ),
                    child: const Text("get Session Id"),
                  ),
                  TextButton(
                    onPressed: () {
                      /// You can get the client id through the AdcioCore() object.
                      /// clientId is initialized with the value entered as a parameter while you call the initializeApp() function.
                      /// ```dart
                      /// String clientId = AdcioCore.clientId;
                      /// ```

                      final String clientId = AdcioCore.clientId;
                      Fluttertoast.showToast(msg: clientId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text("get Client Id"),
                  ),
                  TextButton(
                    onPressed: () {
                      /// You can get the store id through the AdcioCore() object.
                      /// storeId has the same value as clientId.
                      /// ```dart
                      /// String storeId = AdcioCore.storeId;
                      /// ```

                      final String clientId = AdcioCore.storeId;
                      Fluttertoast.showToast(msg: clientId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.green,
                    ),
                    child: const Text("get Store Id"),
                  ),
                ],
              ),
              const Expanded(
                child: Column(
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
