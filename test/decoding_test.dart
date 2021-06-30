import 'dart:typed_data';

import 'package:dart_wallet/extensions/xdr_primitives.dart';
import 'package:dart_wallet/utils/xdr_primitives.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stellar/stellar.dart';

void main() {
  test('C primitives', () {
    var int = 44;
    var outputStream = XdrDataOutputStream();
    int.toXdr(outputStream);
    var intResult =
        intFromXdr(XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(int, intResult);

    var negativeInt = -44;
    outputStream = XdrDataOutputStream();
    negativeInt.toXdr(outputStream);
    intResult =
        intFromXdr(XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(negativeInt, intResult);

    var trueBoolean = true;
    outputStream = XdrDataOutputStream();
    trueBoolean.toXdr(outputStream);
    var boolResult =
        boolFromXdr(XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(trueBoolean, boolResult);

    var falseBoolean = false;
    outputStream = XdrDataOutputStream();
    falseBoolean.toXdr(outputStream);
    boolResult =
        boolFromXdr(XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(falseBoolean, boolResult);

    var enString = "TokenD is awesome!";
    outputStream = XdrDataOutputStream();
    enString.toXdr(outputStream);
    var strResult = stringFromXdr(
        XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(enString, strResult);

    var emptyString = "";
    outputStream = XdrDataOutputStream();
    emptyString.toXdr(outputStream);
    strResult = stringFromXdr(
        XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(emptyString, strResult);

    var ruString = "¬ Я так соскучился 🥰";
    outputStream = XdrDataOutputStream();
    ruString.toXdr(outputStream);
    strResult = stringFromXdr(
        XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(ruString, strResult);

    var list = Uint8List.fromList(List.generate(5, (index) => index + 1));

    outputStream = XdrDataOutputStream();
    list.toXdr(outputStream);
    var listResult = opaqueFromXdr(
        XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(list, listResult);
  });
}