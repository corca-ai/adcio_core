import 'package:flutter/services.dart';

class UnInitializedException extends PlatformException {
  UnInitializedException({
    super.code = 'CALL_INIT_FUNCTION',
    super.message = 'call initializeApp function',
  });
}
