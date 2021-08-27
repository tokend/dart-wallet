import 'dart:typed_data';

import 'package:base32/base32.dart';
import 'package:dart_wallet/extensions/erase_extensions.dart';
import 'package:dart_wallet/extensions/number_extension.dart';
import 'package:dart_wallet/version_byte.dart';
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

/// Performs encoding and decoding of specific data to Base32Check.
/// Base32Check is Base32 encoding with version byte and checksum:
/// &#91;version byte&#93; + &#91;data&#93; + &#91;CRC16 checksum of version byte and data&#93;
class Base32Check {
  /// Returns [true] if encoded data is related to the given version byte
  /// and can be decoded, [false] otherwise.
  static bool isValid(VersionByte versionByte, String data) {
    try {
      decodeCheck(versionByte, data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Encodes given data using [VersionByte.ACCOUNT_ID] version byte.
  static String encodeAccountId(Uint8List data) {
    return encodeCheck(VersionByte(VersionByte.ACCOUNT_ID), data);
  }

  /// Decodes given data using [VersionByte.ACCOUNT_ID] version byte.
  static Uint8List decodeAccountId(String data) {
    return decodeCheck(VersionByte(VersionByte.ACCOUNT_ID), data);
  }

  /// Encodes given data using [VersionByte.SEED] version byte.
  static String encodeSecretSeed(Uint8List data) {
    return encodeCheck(VersionByte(VersionByte.SEED), data);
  }

  /// Decodes given data using [VersionByte.SEED] version byte.
  static Uint8List decodeSecretSeed(String data) {
    return decodeCheck(VersionByte(VersionByte.SEED), data);
  }

  /// Encodes given data using [VersionByte.BALANCE_ID] version byte.
  static encodeBalanceId(Uint8List data) {
    return encodeCheck(VersionByte(VersionByte.BALANCE_ID), data);
  }

  /// Decodes given data using [VersionByte.BALANCE_ID] version byte.
  static Uint8List decodeBalanceId(String data) {
    return decodeCheck(VersionByte(VersionByte.BALANCE_ID), data);
  }

  /// Encodes given data using given version byte.
  static String encodeCheck(VersionByte versionByte, Uint8List data) {
    try {
      var payload = Uint8List(data.length + 1);
      payload[0] = versionByte.value;
      for (int i = 0; i < data.length; i++) {
        payload[i + 1] = data[i];
      }

      var checksum = calculateChecksum(payload);
      List<List<int>> myByteList = List.from([payload, checksum]);

      var unEncoded = Uint8List.fromList(myByteList.expand((x) => x).toList());

      var charsEncoded = base32.encode(unEncoded);

      if (VersionByte.SEED == versionByte.value) {
        unEncoded.erase();
        payload.erase();
        checksum.erase();
      }

      return charsEncoded;
    } catch (e) {
      print(e);
      throw AssertionError();
    }
  }

  /// Decodes given data using given version byte.
  static Uint8List decodeCheck(VersionByte versionByte, String encoded) {
    var decodingResult = decode(encoded);

    if (versionByte.value != decodingResult.item1) {
      throw FormatException("Version byte is invalid");
    }

    return decodingResult.item2;
  }

  /// Decodes given data and obtains it's version byte.
  ///
  /// Returns [Pair] of the version byte and decoded data
  static Tuple2<int, Uint8List> decode(String encoded) {
    var bytes = Uint8List(encoded.length);
    for (int i = 0; i < encoded.length; i++) {
      if (encoded.codeUnitAt(i) > 127) {
        throw ArgumentError("Illegal characters in encoded char array.");
      }
      bytes[i] = encoded.codeUnitAt(i);
    }

    var decoded = base32.decode(encoded);
    var decodedVersionByte = decoded[0];
    Uint8List payload, data, checksum;

    payload = decoded.sublist(0, decoded.length - 2);
    data = payload.sublist(1, payload.length);
    checksum = decoded.sublist(decoded.length - 2, decoded.length);

    var expectedChecksum = calculateChecksum(payload);

    if (!listEquals(expectedChecksum, checksum)) {
      throw FormatException("Checksum invalid");
    }

    if (VersionByte.SEED == decodedVersionByte) {
      bytes.fillRange(0, bytes.length, 0);
      decoded.fillRange(0, decoded.length, 0);
      payload.fillRange(0, payload.length, 0);
    }

    var versionByte = decodedVersionByte;
    return Tuple2(versionByte, data);
  }

  static Uint8List calculateChecksum(Uint8List bytes) {
    // This code calculates CRC16-XModem checksum
    // Ported from https://github.com/alexgorbatchev/node-crc
    var crc = 0x0000;
    var count = bytes.length;
    var i = 0;
    int code;

    while (count > 0) {
      code = crc.zeroFillRightShift(8) & 0xff;
      code = code ^ (bytes[i++]).toInt() & 0xFF;
      code = code ^ code.zeroFillRightShift(4);
      crc = crc << 8 & 0xFFFF;
      crc = crc ^ code;
      code = code << 5 & 0xFFFF;
      crc = crc ^ code;
      code = code << 7 & 0xFFFF;
      crc = crc ^ code;
      count--;
    }

    // little-endian
    return Uint8List.fromList([crc, crc.zeroFillRightShift(8)]);
  }
}
