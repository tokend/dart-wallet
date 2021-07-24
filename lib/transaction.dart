import 'dart:math';

import 'package:dart_wallet/network_params.dart';
import 'package:dart_wallet/utils/hashing.dart';

import 'account.dart' as Account;
import 'xdr/utils/dependencies.dart';
import 'xdr/xdr_types.dart' as Types;

/// Represents TokenD transaction - a set of operations that changes the state of the system.
///
/// @see <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/transaction">Transaction in the Knowledge base</a>
class Transaction {
  /// Params of the network into which the transaction will be sent.
  late NetworkParams networkParams;

  /// Original account ID of the transaction initiator.
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/transaction#source-account">Source account ID in the Knowledge base</a>
  late Types.ACCOUNTID sourceAccountId;

  /// Optional transaction payload.
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/transaction#memo">Memo in the Knowledge base</a>
  late Types.Memo memo;

  /// List of operations performed by this transaction.
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/operations">Operations overview in the Knowledge base</a>
  late List<Types.Operation> operations;

  /// Time range during which the transaction will be valid.
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/transaction#time-bounds">Time bounds in the Knowledge base</a>
  late Types.TimeBounds timeBounds;

  /// Any number that ensures the uniqueness of the transaction.
  late Int64 salt;

  var _signatures = <Types.DecoratedSignature>[];

  /// List of signatures for the transaction.
  List<Types.DecoratedSignature> get signatures => _signatures.toList();

  Transaction(NetworkParams networkParams, Types.ACCOUNTID sourceAccountId,
      List<Types.Operation> operations,
      {Types.Memo? memo, Types.TimeBounds? timeBounds, Int64? salt}) {
    if (operations.isEmpty) {
      throw ArgumentError("Transaction must contain at least one operation");
    }

    this.networkParams = networkParams;
    this.sourceAccountId = sourceAccountId;
    this.operations = operations;

    this.memo = memo ?? Types.MemoMemoNone();
    this.timeBounds = timeBounds ??
        Types.TimeBounds(Int64(0),
            Int64(networkParams.nowTimestamp + DEFAULT_LIFETIME_SECONDS));
    var isSaltValid = salt != Int64.MIN_VALUE;
    if (isSaltValid) {
      this.salt =
          salt?.abs() ?? Int64(Random().nextInt(9) & 0x7fffffffffffffff).abs();
    } else {
      throw ArgumentError("Can't use $salt as a salt");
    }
  }

  /// Creates a copy of given XDR-wrapped transaction.
  /// [networkParams] is network specification
  /// [transactionEnvelope] is XDR-wrapped transaction with signatures
  Transaction.Copy(NetworkParams networkParams,
      Types.TransactionEnvelope transactionEnvelope) {
    this.networkParams = networkParams;
    this.sourceAccountId = transactionEnvelope.tx.sourceAccount;
    this.operations = transactionEnvelope.tx.operations.toList();
    this.memo = transactionEnvelope.tx.memo;
    this.timeBounds = transactionEnvelope.tx.timeBounds;
    this.salt = transactionEnvelope.tx.salt;
    this._signatures.addAll(transactionEnvelope.signatures);
  }

  /// Adds signature from given signer to transaction signatures.
  addSignature(Account.Account signer) async {
    var decoratedSig = await getSignature(
        signer, networkParams.networkId, _getXdrTransaction());
    addGivenSignature(decoratedSig);
  }

  /// Adds given signature to transaction signatures.
  addGivenSignature(Types.DecoratedSignature decoratedSignature) {
    _signatures.add(decoratedSignature);
  }

  /// Returns XDR-wrapped transaction with all signatures.
  Types.TransactionEnvelope getEnvelope() {
    return Types.TransactionEnvelope(_getXdrTransaction(), _signatures);
  }

  Types.Transaction _getXdrTransaction() {
    return Types.Transaction(sourceAccountId, salt, timeBounds, memo,
        operations, Types.TransactionExtEmptyVersion());
  }

  static const DEFAULT_LIFETIME_SECONDS = 7 * 24 * 3600 - 3600;

  static Future<Types.DecoratedSignature> getSignature(Account.Account signer,
      Uint8List networkId, Types.Transaction xdrTransaction) async {
    var signDecorated = await signer
        .signDecorated(getHash(getSignatureBase(networkId, xdrTransaction)));
    return signDecorated;
  }

  Uint8List hash() {
    return getHash(
        getSignatureBase(networkParams.networkId, _getXdrTransaction()));
  }

  /// Return SHA-256 hash of given transaction signature base
  /// See [getSignatureBase]
  static Uint8List getHash(Uint8List signatureBase) {
    var a = Hashing.sha256hashing(signatureBase);
    return a;
  }

  /// Return base content for transaction signature
  /// See NetworkParams.networkId
  static Uint8List getSignatureBase(
      Uint8List networkId, Types.Transaction xdrTransaction) {
    List<int> output = List.empty(growable: true);
    var envTypeArray = Uint8List.fromList(List.generate(4, (_) => 0));
    envTypeArray[3] = Types.EnvelopeType(Types.EnvelopeType.TX).value;
    output.addAll(networkId);
    output.addAll(envTypeArray);

    var txXdrOutputStream = XdrDataOutputStream();
    xdrTransaction.toXdr(txXdrOutputStream);
    output.addAll(txXdrOutputStream.bytes);

    return Uint8List.fromList(output);
  }
}
