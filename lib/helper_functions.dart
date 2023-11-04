import 'package:flutter/foundation.dart';

double boundNumber(double normalNumber, double max, double min) {
  if (normalNumber >= max) {
    return max;
  } else if (normalNumber <= min) {
    return min;
  }
  return normalNumber;
}

String platformAwarePath(str) {
  return (kIsWeb) ? 'assets/$str' : str;
}
