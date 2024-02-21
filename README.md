#  adcio_core
[![pub package](https://img.shields.io/pub/v/adcio_core.svg)](https://pub.dev/packages/adcio_core)

Provides values commonly used by the ADCIO SDK during side-effect-free behavior.
Typical values provided are sessionId and deviceId.

To learn more about ADCIO, please visit the [ADCIO website](https://www.adcio.ai/)

## Getting Started
To get started with ADCIO account, please register [ADCIO account](https://app.adcio.ai/en/)

## Usage
There is a simple use example:
```dart
// Get DeviceId
String deviceId = await DeviceIdentifier().loadId();

// Get SessionId
String sessionId = SessionIdentifier().loadId();
```
To learn more about usage of plugin, please visit the [AdcioCore Usage documentation.](https://docs.adcio.ai/en/sdk/flutter/core)

## Issues and feedback
If the plugin has issues, bugs, feedback, Please contact <app@corca.ai>.