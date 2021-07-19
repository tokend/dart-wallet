import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/utils/hashing.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class SimpleSetFeesOp extends SetFeesOp {
  SimpleSetFeesOp(bool isDelete, FeeType type, String asset, Int64 fixed,
      Int64 percent, Int64 upperBound, Int64 lowerBound,
      {Int64 subtype = Int64.ZERO, String? accountId, UINT64? accountRole})
      : super(
            FeeEntry(
                type,
                asset,
                fixed,
                percent,
                PublicKeyFactory.fromAccountId(accountId!),
                accountRole,
                subtype,
                lowerBound,
                upperBound,
                getHash(type, asset, subtype, accountId, accountRole),
                FeeEntryExtEmptyVersion()),
            isDelete,
            SetFeesOpExtEmptyVersion());

  static HASH getHash(FeeType type, String asset, Int64 subtype,
      String? accountId, UINT64? accountRole) {
    var data = "type:${type.value}asset:${asset}subtype:$subtype";
    if (accountId != null) {
      data += "accountID:$accountId";
    }

    if (accountRole != null) {
      data += "accountRole:$accountRole";
    }

    return HASH(Hashing.sha256hashing(Uint8List.fromList(data.codeUnits)));
  }
}
