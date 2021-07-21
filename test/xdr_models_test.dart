import 'package:dart_wallet/base32check.dart';
import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/xdr/op_extensions/simple_payment_op.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var _accountId = "GB5V4R2P6EPS7VDDTWATJKSS3F4FWRIPNRKCWFL6WSYIWBN3L6YH3A3J";
  var _balanceId = "BA7UXH23ZELVU6XZFEXMAE3J4QJTGG3F5ZPOV2BJ335CMGO6BHWRODQG";
  var _assetCode = "OLG";
  var _amount = Int64(12345600);
  var _bytesAccountId =
      PublicKeyKeyTypeEd25519(UINT256(Base32Check.decodeAccountId(_accountId)));
  var _bytesBalanceId =
      PublicKeyKeyTypeEd25519(UINT256(Base32Check.decodeBalanceId(_balanceId)));

  test('create balance operation', () {
    var manageBalanceOp = ManageBalanceOp(
        ManageBalanceAction(ManageBalanceAction.CREATE),
        _bytesAccountId,
        _assetCode,
        ManageBalanceOpExtEmptyVersion());

    var op = Operation(null, OperationBodyManageBalance(manageBalanceOp));

    expect(op.toBase64(),
        "AAAAAAAAAAkAAAAAAAAAAHteR0/xHy/UY52BNKpS2XhbRQ9sVCsVfrSwiwW7X7B9AAAAA09MRwAAAAAA");
  });

  test('delete balance operation', () {
    var manageBalanceOp = ManageBalanceOp(
        ManageBalanceAction(ManageBalanceAction.DELETE_BALANCE),
        _bytesAccountId,
        _assetCode,
        ManageBalanceOpExtEmptyVersion());

    var op = Operation(null, OperationBodyManageBalance(manageBalanceOp));

    expect(op.toBase64(),
        "AAAAAAAAAAkAAAABAAAAAHteR0/xHy/UY52BNKpS2XhbRQ9sVCsVfrSwiwW7X7B9AAAAA09MRwAAAAAA");
  });

  test('payment operation', () {
    var paymentOp = SimplePaymentOp(
        _bytesBalanceId,
        _bytesAccountId,
        _amount,
        PaymentFeeData(
            Fee(Int64.ZERO, Int64.ZERO, FeeExtEmptyVersion()),
            Fee(Int64.ZERO, Int64.ZERO, FeeExtEmptyVersion()),
            false,
            PaymentFeeDataExtEmptyVersion()),
        subject: "Test");

    var op = Operation(null, OperationBodyPayment(paymentOp));

    expect(
      op.toBase64(),
      "AAAAAAAAABcAAAAAP0ufW8kXWnr5KS7AE2nkEzMbZe5e6ugp3vomGd4J7RcAAAAAAAAAAHteR0/xHy/UY52BNKpS2XhbRQ9sVCsVfrSwiwW7X7B9AAAAAAC8YQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEVGVzdAAAAAAAAAAA",
    );
  });

  test('manage signer operation', () {
    var manageOp = ManageSignerOp(
        ManageSignerOpDataCreate(UpdateSignerData(
            PublicKeyFactory.fromAccountId(_accountId),
            Int64(255),
            255,
            255,
            "",
            EmptyExtEmptyVersion())),
        EmptyExtEmptyVersion());

    var op = Operation(null, OperationBodyManageSigner(manageOp));

    expect(
      op.toBase64(),
      "AAAAAAAAACYAAAAAAAAAAHteR0/xHy/UY52BNKpS2XhbRQ9sVCsVfrSwiwW7X7B9AAAAAAAAAP8AAAD/AAAA/wAAAAAAAAAAAAAAAA==",
    );
  });
}
