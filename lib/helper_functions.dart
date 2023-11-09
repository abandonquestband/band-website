import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

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

Future<void> openUrl(path) async {
  final Uri url = Uri.parse(path);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
