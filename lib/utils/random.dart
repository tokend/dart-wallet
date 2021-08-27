import 'dart:math';

const MAX_DIGIT_VALUE = 9;

class Randomizer {
  static String getRandomString(int length) {
    var sourceRandom = Random.secure();
    var randomString = '';
    for (int i = 0; i < length; i++) {
      randomString += '${sourceRandom.nextInt(MAX_DIGIT_VALUE)}';
    }
    return randomString;
  }
}
