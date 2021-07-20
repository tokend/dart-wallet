import 'dart:typed_data';

import 'package:dart_wallet/extensions/xdr_primitives.dart';
import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/utils/xdr_primitives.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart' as types;
import 'package:dart_wallet/xdr/xdr_types.dart';
import 'package:flutter_test/flutter_test.dart';

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

  test('decode all required', () {
    var sourceRequest = types.UpdateMaxIssuance(
        "OLE", Int64(5495), types.UpdateMaxIssuanceExtEmptyVersion());
    print(sourceRequest.toBase64());

    var source = types.OperationBodyManageAsset(ManageAssetOp(
        Int64(4020),
        ManageAssetOpRequestUpdateMaxIssuance(sourceRequest),
        ManageAssetOpExtEmptyVersion()));
    print(source.toBase64());
  });

  test('decode with optionals', () {
    var source = types.AccountEntry(
        PublicKeyFactory.fromAccountId(
            "GDLWLDE33BN7SG6V4P63V2HFA56JYRMODESBLR2JJ5F3ITNQDUVKS2JE"),
        null,
        Int64(404),
        Int64(333),
        types.AccountEntryExtEmptyVersion());

    print(source.toBase64());
  });
}
