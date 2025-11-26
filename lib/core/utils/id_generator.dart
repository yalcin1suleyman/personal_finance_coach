import 'dart:math';

class IdGenerator {
  static final Random _random = Random();

  static String generate() {
    final millis = DateTime.now().millisecondsSinceEpoch;
    final randomPart = _random.nextInt(1 << 32).toRadixString(16).padLeft(8, '0');
    return '$millis$randomPart';
  }
}





