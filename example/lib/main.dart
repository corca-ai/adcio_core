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
    AdcioCore.initializeApp("init adcio_core");

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      Fluttertoast.showToast(msg: AdcioCore.deviceId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.amber,
                    ),
                    child: const Text("get Device Id"),
                  ),
                  TextButton(
                    onPressed: () =>
                        Fluttertoast.showToast(msg: AdcioCore.sessionId),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.indigo,
                    ),
                    child: const Text("get Session Id"),
                  ),
                  TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: AdcioCore.clientId);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text("get Client Id"),
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
