import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class DeleteBalanceOp extends ManageBalanceOp {
  DeleteBalanceOp(ACCOUNTID accountId, ASSETCODE assetCode)
      : super(ManageBalanceAction(ManageBalanceAction.DELETE_BALANCE),
            accountId, assetCode, ManageBalanceOpExtEmptyVersion());

  DeleteBalanceOp.fromPubKey(String accountId, String assetCode)
      : this(PublicKeyFactory.fromAccountId(accountId), assetCode);
}
