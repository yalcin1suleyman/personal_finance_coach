import 'dart:math';

extension NumFormattingX on num {
  double toPrecision([int fractionDigits = 2]) {
    final mod = pow(10.0, fractionDigits);
    return (this * mod).roundToDouble() / mod;
  }
}

