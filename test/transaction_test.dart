import 'dart:convert';

import 'package:dart_wallet/account.dart';
import 'package:dart_wallet/network_params.dart';
import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/transaction.dart' as Tr;
import 'package:dart_wallet/xdr/op_extensions/simple_payment_op.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  var _sourceAccountId =
      "GDVJSBSBSERR3YP3LKLHTODWEFGCSLDWDIODER3CKLZXUMVPZOPT4MHY";
  var _network = NetworkParams("Example Test Network");

  var _sourceBalance =
      "BBVRUASMC2OMFGWHQPD4TTXTZZ7ACOFWWFTB5Y3K6757FSUSAEPEPXAS";
  var _destAccount = "GDBTAGESMWHT2OISMGJ27HB6WQB2FVNEEIZL2SRBD2CXN26L6J4NKDP2";
  var _sourceAccountSeed =
      "SBEBZQIXHAZ3BZXOJEN6R57KMEDISGBIIP6LAVRCNDM4WZIQPHNYZICC";
  var _account = await Account.fromSecretSeed(_sourceAccountSeed);

  var _paymentOp = SimplePaymentOp.fromPubKeys(
      _sourceBalance,
      _destAccount,
      Int64(1000000),
      PaymentFeeData(
          Fee(Int64(0), Int64(0), FeeExtEmptyVersion()),
          Fee(Int64(0), Int64(0), FeeExtEmptyVersion()),
          false,
          PaymentFeeDataExtEmptyVersion()),
      subject: "Test");

  var sampleTransaction = Tr.Transaction(
      _network,
      PublicKeyFactory.fromAccountId(_sourceAccountId),
      List.of([Operation(null, OperationBodyPayment(_paymentOp))]),
      memo: MemoMemoText("Sample text"),
      timeBounds: TimeBounds(Int64(0), Int64(42)),
      salt: Int64(0));
  sampleTransaction.addSignature(_account);

  test('encoding', () {
    var transaction = sampleTransaction;

    var expectedEnvelope =
        "AAAAAOqZBkGRIx3h+1qWebh2IUwpLHYaHDJHYlLzejKvy58+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAqAAAAAQAAAAtTYW1wbGUgdGV4dAAAAAABAAAAAAAAABcAAAAAaxoCTBacwprHg8fJzvPOfgE4trFmHuNq9/vyypIBHkcAAAAAAAAAAMMwGJJljz05EmGTr5w+tAOi1aQiMr1KIR6FduvL8njVAAAAAAAPQkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEVGVzdAAAAAAAAAAAAAAAAAAAAAHjQTipAAAAQF34oMJ+LK2Zu5FQIxbCsETYs5ELbzp4QsjS/5iu5rwxSiNtKBOGPwN43O57bMOEetTYdPWC+J2BKASM7eXVKQ0=";
    var envelope = transaction.getEnvelope().toBase64();
    expect(expectedEnvelope, envelope);
  });

  test('no operations', () {
    try {
      Tr.Transaction(_network, PublicKeyFactory.fromAccountId(_sourceAccountId),
          List.empty());
      expect(() {
        assert(false);
      }, throwsA(isA<AssertionError>()));
    } catch (e) {}
  });

  test('hash', () {
    var expectedHash = "TcNNk7QSlWHviChZnnuwUp5tE6BxXL2BhFpWD6/4k3M=";
    var hash = base64Encode(sampleTransaction.hash());
    expect(hash, expectedHash);
  });

  test('salt', () {
    var salt = Int64.MIN_VALUE + 1;

    var transaction = Tr.Transaction(
      _network,
      PublicKeyFactory.fromAccountId(_sourceAccountId),
      List.of([Operation(null, OperationBodyPayment(_paymentOp))]),
      salt: salt,
    );
    expect(Int64.MAX_VALUE, transaction.salt);
  });

  test('long MinValue salt', () {
    try {
      Tr.Transaction(
        _network,
        PublicKeyFactory.fromAccountId(_sourceAccountId),
        List.of([Operation(null, OperationBodyPayment(_paymentOp))]),
        salt: Int64.MIN_VALUE,
      );
    } catch (e) {
      print(e);
    }
  });
}
