import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_wallet/base32check.dart';
import 'package:dart_wallet/utils/random.dart';
import 'package:dart_wallet/version_byte.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var seedEncoded = 'SDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCRHBE';
  var accountIdEncoded =
      'GDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCQDS3';
  var balanceIdEncoded =
      'BDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCQMUQ';
  var bytes = Uint8List.fromList(hex.decode(
      "D278C0BC3098842800043C83E39ABFF6581567A51607C94A1F0651B3F4BDAC28"));

  test('encodeSeed', () {
    var encoded = Base32Check.encodeSecretSeed(bytes);
    expect(encoded, seedEncoded);
  });

  test('decodeSeed', () {
    var decoded = Base32Check.decodeSecretSeed(seedEncoded);
    expect(decoded, bytes);
  });

  test('encodeAccountId', () {
    var encoded = Base32Check.encodeAccountId(bytes);
    expect(encoded, accountIdEncoded);
  });

  test('decodeAccountId', () {
    var decoded = Base32Check.decodeAccountId(accountIdEncoded);
    expect(decoded, bytes);
  });

  test('encodeBalanceId', () {
    var encoded = Base32Check.encodeBalanceId(bytes);
    expect(encoded, balanceIdEncoded);
  });

  test('decodeBalanceId', () {
    var decoded = Base32Check.decodeBalanceId(balanceIdEncoded);
    expect(decoded, bytes);
  });

  test('decodeInvalidVersionByte', () {
    try {
      Base32Check.decodeAccountId(seedEncoded);
    } catch (e) {}
  });

  test('validation', () {
    var isValid = Base32Check.isValid(
        VersionByte(VersionByte.ACCOUNT_ID), accountIdEncoded);
    var isInValid = Base32Check.isValid(
        VersionByte(VersionByte.BALANCE_ID), accountIdEncoded);
    expect(isValid, true);
    expect(isInValid, false);
  });

  test('randomData', () {
    String s = Randomizer.getRandomString(50);
    var source = Uint8List.fromList(s.codeUnits);
    var encoded = Base32Check.encodeAccountId(source);
    var decoded = Base32Check.decodeAccountId(encoded);
    expect(source, decoded);
  });
}
