import 'package:dart_wallet/xdr/xdr_types.dart';

class BindExternalAccountOp extends BindExternalSystemAccountIdOp {
  BindExternalAccountOp(INT32 externalSystemType)
      : super(
            externalSystemType, BindExternalSystemAccountIdOpExtEmptyVersion());
}
