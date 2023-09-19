import 'package:flutter/services.dart';

class UnInitializedException extends PlatformException {
  UnInitializedException({
    super.code = 'UNINITIALIZED',
    super.message = 'The plugin has not been initialized properly.',
  });
}
