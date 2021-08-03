import 'package:dart_wallet/account.dart';
import 'package:dart_wallet/network_params.dart';
import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/transaction_builder.dart';
import 'package:dart_wallet/xdr/op_extensions/create_balance_op.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var sourceAccountId =
      "GDVJSBSBSERR3YP3LKLHTODWEFGCSLDWDIODER3CKLZXUMVPZOPT4MHY";
  var sourceAccountPubKey = PublicKeyFactory.fromAccountId(sourceAccountId);
  var network = NetworkParams("Example Test Network");
  var simpleOp = ManageBalanceOp(
      ManageBalanceAction(ManageBalanceAction.CREATE),
      sourceAccountPubKey,
      "OLG",
      ManageBalanceOpExtEmptyVersion());
  var simpleOp2 = ManageBalanceOp(
      ManageBalanceAction(ManageBalanceAction.CREATE),
      sourceAccountPubKey,
      "OLE",
      ManageBalanceOpExtEmptyVersion());

  test('single operation', () async {
    var operationBody = OperationBodyManageBalance(simpleOp);
    var _transaction = TransactionBuilder(network, sourceAccountPubKey)
        .addOperation(operationBody)
        .build();

    var transaction = await _transaction;
    expect(sourceAccountPubKey, transaction.sourceAccountId);
    expect(network.passphrase, transaction.networkParams.passphrase);
    expect(operationBody.toBase64(), transaction.operations[0].body.toBase64());
  });

  test('multiple operations', () async {
    var operationBodies = List.of([
      OperationBodyManageBalance(simpleOp),
      OperationBodyManageBalance(simpleOp2)
    ]);

    var _transaction = TransactionBuilder(network, sourceAccountPubKey)
        .addOperations(operationBodies)
        .build();
    var transaction = await _transaction;

    expect(sourceAccountPubKey, transaction.sourceAccountId);
    expect(network.passphrase, transaction.networkParams.passphrase);
    expect(operationBodies[0].toBase64(),
        transaction.operations[0].body.toBase64());
    expect(operationBodies[1].toBase64(),
        transaction.operations[1].body.toBase64());
  });

  test('set memo', () async {
    var memoText = "TokenD is awesome";
    var _transaction = TransactionBuilder(network, sourceAccountPubKey)
        .addOperation(OperationBodyManageBalance(simpleOp))
        .setMemo(MemoMemoText(memoText))
        .build();
    var transaction = await _transaction;

    expect(transaction.memo is MemoMemoText, true);
    expect(memoText, (transaction.memo as MemoMemoText).text);
  });

  test('set time bounds', () async {
    var timeBounds = TimeBounds(Int64(1), Int64(5));
    var _transaction = TransactionBuilder(network, sourceAccountPubKey)
        .addOperation(OperationBodyManageBalance(simpleOp))
        .setTimeBounds(timeBounds)
        .build();
    var transaction = await _transaction;

    expect(timeBounds.maxTime, transaction.timeBounds.maxTime);
    expect(timeBounds.minTime, transaction.timeBounds.minTime);
  });

  test('set salt', () async {
    var salt = Int64(42);
    var _transaction = TransactionBuilder(network, sourceAccountPubKey)
        .addOperation(OperationBodyManageBalance(simpleOp))
        .setSalt(salt)
        .build();
    var transaction = await _transaction;

    expect(salt, transaction.salt);
  });

  test('add signer', () async {
    var signer = await Account.random();
    var signerHint =
        await signer.signDecorated(Uint8List.fromList(List.empty()));
    var _transaction = TransactionBuilder(network, sourceAccountPubKey)
        .addOperation(OperationBodyManageBalance(simpleOp))
        .addSigner(signer)
        .build();
    var transaction = await _transaction;

    expect(1, transaction.signatures.length);
    expect(signerHint.hint.wrapped, transaction.signatures[0].hint.wrapped);
  });

  test('add signer', () async {
    var SEED = "SBUFJEEK7FMWXPE4HGOWQZPHZ4V5TFKGSF664RAGT24NS662MKTQ7J6S";
    var NETWORK = NetworkParams("Example Test Network");

    var sourceAccount = await Account.fromSecretSeed(SEED);

    var accountId = sourceAccount.accountId;
    var operation =
        CreateBalanceOp(PublicKeyFactory.fromAccountId(accountId), "OLE");

    var transaction = await TransactionBuilder(
            NETWORK, PublicKeyFactory.fromAccountId(accountId))
        .addOperation(OperationBodyManageBalance(operation))
        .setMemo(MemoMemoText("TokenD is awesome"))
        .addSigner(sourceAccount)
        .build();

    var envelope = transaction.getEnvelope().toBase64();
  });
}
