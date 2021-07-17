import 'package:dart_wallet/account.dart' as Account;
import 'package:dart_wallet/network_params.dart';
import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/transaction.dart' as Tr;
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:stellar/stellar.dart';

import 'xdr/xdr_types.dart' as Types;

/// Builds a [Transaction] object.
///
/// [networkParams] params of the network into which the transaction will be sent
/// [sourceAccountId] original account ID of the transaction initiator
class TransactionBuilder {
  late NetworkParams _networkParams;
  late Types.ACCOUNTID _sourceAccountId;
  var _operations = <Types.Operation>[];
  Types.Memo? _memo;
  Types.TimeBounds? _timeBounds;
  Int64? salt;
  List<Account.Account> _signers = <Account.Account>[];

  TransactionBuilder(
      NetworkParams networkParams, Types.ACCOUNTID sourceAccountId) {
    this._networkParams = networkParams;
    this._sourceAccountId = sourceAccountId;
  }

  /// [networkParams] params of the network into which the transaction will be sent
  /// [sourceAccountId] original account ID of the transaction initiator
  TransactionBuilder.FromPubKey(
      NetworkParams networkParams, String sourceAccountId) {
    TransactionBuilder(
        networkParams, PublicKeyFactory.fromAccountId(sourceAccountId));
    this._networkParams = networkParams;
    this._sourceAccountId = PublicKeyFactory.fromAccountId(sourceAccountId);
  }

  /// Adds operation with given body to the result transaction.
  /// See Transaction.operations
  TransactionBuilder addOperation(Types.OperationBody operationBody,
      {Types.ACCOUNTID? operationSourceAccount}) {
    _operations.add(Types.Operation(operationSourceAccount, operationBody));
    return this;
  }

  /// Adds operations with given bodies to the result transaction.
  /// See Transaction.operations
  TransactionBuilder addOperations(
      Iterable<Types.OperationBody> operationBodies,
      {Types.ACCOUNTID? operationsSourceAccount}) {
    _operations.addAll(operationBodies
        .map((e) => Types.Operation(operationsSourceAccount, e)));
    return this;
  }

  /// Sets memo of the result transaction.
  /// See [Transaction.memo]
  TransactionBuilder setMemo(Types.Memo memo) {
    this._memo = memo;
    return this;
  }

  /// Sets range of time during which the
  /// result transaction will be valid.
  /// Default transaction lifetime is [Transaction.DEFAULT_LIFETIME_SECONDS]
  /// [timeBounds] time range in unixtime
  /// See Transaction.timeBounds
  TransactionBuilder setTimeBounds(Types.TimeBounds timeBounds) {
    this._timeBounds = timeBounds;
    return this;
  }

  /// Sets salt of the result transaction.
  /// By default transaction salt is a random [Int64].
  /// @see Transaction.salt
  TransactionBuilder setSalt(Int64 salt) {
    this.salt = salt;
    return this;
  }

  /// Adds given account as a signer of the result transaction
  /// See Transaction.addSignature
  TransactionBuilder addSigner(Account.Account signer) {
    this._signers.add(signer);
    return this;
  }

  /// Builds the result transaction.
  Tr.Transaction build() {
    var transaction = Tr.Transaction(
        _networkParams, _sourceAccountId, _operations,
        memo: _memo, timeBounds: _timeBounds, salt: salt);

    _signers.forEach((signer) {
      transaction.addSignature(signer);
    });

    return transaction;
  }
}
