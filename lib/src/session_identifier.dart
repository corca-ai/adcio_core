import 'package:uuid/uuid.dart';

class SessionIdentifier {
  static final String _identifier = _createIdentifier();

  String get identifier => _identifier;

  static String _createIdentifier() {
    return const Uuid().v4();
  }

  String loadId() {
    return identifier;
  }
}
