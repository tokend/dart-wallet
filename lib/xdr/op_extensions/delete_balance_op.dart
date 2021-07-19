import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class DeleteBalanceOp extends ManageBalanceOp {
  DeleteBalanceOp(ACCOUNTID accountId, ASSETCODE asset)
      : super(ManageBalanceAction(ManageBalanceAction.DELETE_BALANCE), accountId, asset, ManageBalanceOpExtEmptyVersion());

  DeleteBalanceOp.fromPubKey(String accountId, ASSETCODE asset)
      : this(PublicKeyFactory.fromAccountId(accountId), asset);
}