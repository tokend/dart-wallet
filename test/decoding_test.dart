import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_wallet/base32check.dart';
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

    var long = Int64(55);
    outputStream = XdrDataOutputStream();
    long.toXdr(outputStream);
    var longResult =
        longFromXdr(XdrDataInputStream(Uint8List.fromList(outputStream.bytes)));
    expect(long, longResult);

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

    var source = types.OperationBodyManageAsset(ManageAssetOp(
        Int64(4020),
        ManageAssetOpRequestUpdateMaxIssuance(sourceRequest),
        ManageAssetOpExtEmptyVersion()));

    var stream = XdrDataInputStream(base64Decode(source.toBase64()));

    var decoded = types.OperationBody.fromXdr(stream);
    expect(source.discriminant.value, decoded.discriminant.value);

    var decodedOp = (decoded as types.OperationBodyManageAsset).manageAssetOp;
    expect(decodedOp.requestID, source.manageAssetOp.requestID);

    var decodedRequest =
        (decodedOp.request as types.ManageAssetOpRequestUpdateMaxIssuance)
            .updateMaxIssuance;
    expect(decodedRequest.assetCode, sourceRequest.assetCode);
    expect(decodedRequest.maxIssuanceAmount, sourceRequest.maxIssuanceAmount);
    expect(decodedRequest.ext.discriminant.value,
        sourceRequest.ext.discriminant.value);
  });

  test('decode with optionals', () {
    var source = types.AccountEntry(
        PublicKeyFactory.fromAccountId(
            "GDLWLDE33BN7SG6V4P63V2HFA56JYRMODESBLR2JJ5F3ITNQDUVKS2JE"),
        null,
        Int64(404),
        Int64(333),
        types.AccountEntryExtEmptyVersion());

    var stream = XdrDataInputStream(base64Decode(source.toBase64()));

    var decoded = types.AccountEntry.fromXdr(stream);
    expect(source.sequentialID, decoded.sequentialID);
    expect(source.referrer, null);
  });

  test('tx result', () {
    var createdBalanceId =
        "BDGDRIG2WFR7HJESFI35WFUKS5XXEMIZIU44MBXVD3GXNRDXVLFDBGJW";
    var result =
        "AAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAJAAAAAAAAAADMOKDasWPzpJIqN9sWipdvcjEZRTnGBvUezXbEd6rKMAAAAAAAAAAA";

    var stream = XdrDataInputStream(base64Decode(result));

    var decoded = TransactionResult.fromXdr(stream);

    var decodedResultTr =
        (((decoded.result as types.TransactionResultResultTxsuccess)
                .results
                .first) as types.OperationResultOpinner)
            .tr;

    var balanceID = (((decodedResultTr as types.OperationResultTrManageBalance)
            .manageBalanceResult) as types.ManageBalanceResultSuccess)
        .success
        .balanceID;

    var wrapped = (balanceID as types.PublicKeyKeyTypeEd25519).ed25519.wrapped;
    var encodedBalanceId = Base32Check.encodeBalanceId(wrapped);

    expect(createdBalanceId, encodedBalanceId);
  });
}
