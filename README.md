#  adcio_core

A Flutter plugin that stores and provides resources commonly used by ADCIO.  
Because all plugins in ADCIO depend on adcio_core, the function of adcio_core must be called first.

To learn more about ADCIO, please visit the [ADCIO website](https://www.adcio.ai/)

## Getting Started
<!--
TODO Documentation introduction url 수정하기.
-->
To get started with ADCIO account, please [see the documentation.](https://docs.adcio.ai/en/docs/introduction)

## Usage
There is a simple use example:
```dart
import 'package:adcio_core/adcio_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// this is important to call `AdcioCore.initializeApp(clientId: 'ADCIO_STORE_ID')` function.
  await AdcioCore.initializeApp(
      clientId: 'f8f2e298-c168-4412-b82d-98fc5b4a114a');

  runApp(const MainApp());
}
```
To learn more about usage of plugin, please visit the [AdcioCore Usage documentation.](https://docs.adcio.ai/en/sdk/core/flutter)

## Issues and feedback
If the plugin has issues, bugs, feedback, Please contact <dev@corca.ai>.