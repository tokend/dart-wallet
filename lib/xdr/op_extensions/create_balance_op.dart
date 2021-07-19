import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class CreateBalanceOp extends ManageBalanceOp {
  late ACCOUNTID accountId;
  late ASSETCODE assetCode;

  CreateBalanceOp(ACCOUNTID accountId, ASSETCODE assetCode)
      : super(ManageBalanceAction(ManageBalanceAction.CREATE_UNIQUE), accountId,
            assetCode, ManageBalanceOpExtEmptyVersion()) {
    this.accountId = accountId;
    this.assetCode = assetCode;
  }

  CreateBalanceOp.FromPubKey(String accountId, String assetCode)
      : this(PublicKeyFactory.fromAccountId(accountId), assetCode);
}
