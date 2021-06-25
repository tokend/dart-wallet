import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class Hashing {
  Uint8List sha256hashing(Uint8List data) {
    try {
      return sha256.convert(data).bytes;
    } catch (e) {
      print(e);
      throw Exception("SHA-256 not implemented");
    }
  }
}