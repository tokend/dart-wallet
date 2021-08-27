import 'dart:math';

import 'package:dart_wallet/xdr/utils/dependencies.dart';

class Randomizer {
  static String getRandomString(int length) {
    var sourceRandom = Random.secure();
    var randomString = '';
    for (int i = 0; i < length; i++) {
      randomString += '${sourceRandom.nextInt(Int32.MAX_VALUE.toInt())}';
    }
    return randomString;
  }
}
