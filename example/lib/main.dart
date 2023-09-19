import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:adcio_core/adcio_core.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// this is important to call `AdcioCore().initializeApp(clientId)` function.
    /// If you do not call this function, you will be restricted from using all the features in the AdcioCore package.
    /// ```dart
    /// AdcioCore().initializeApp("...");
    /// ```
    /// this function return `Future<void>`.

    AdcioCore().initializeApp("init adcio_core");

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
                      /// String deviceId = AdcioCore().deviceId; // result: sample device id
                      /// AdcioCore().deviceid = "set device id"; // set device id value
                      /// String deviceId = AdcioCore().deviceId; // result: set device id
                      /// ```

                      final String deviceId = AdcioCore().deviceId;
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
                      /// String sessionId = AdcioCore().sessionId; // result: sample session id
                      /// AdcioCore().sessionId = "set session id"; // set session id value
                      /// String sessionId = AdcioCore().sessionId; // result: set session id
                      /// ```

                      final String sessionId = AdcioCore().sessionId;
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
                      /// String clientId = AdcioCore().clientId;
                      /// ```

                      final String clientId = AdcioCore().clientId;
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
                      /// String storeId = AdcioCore().storeId;
                      /// ```

                      final String clientId = AdcioCore().storeId;
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
