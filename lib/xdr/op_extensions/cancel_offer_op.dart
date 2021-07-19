import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class CancelOfferOp extends ManageOfferOp {
  CancelOfferOp(UINT64 offerId, bool isBuy, {UINT64 orderBookID = Int64.ZERO})
      : super(
            PublicKeyKeyTypeEd25519(XdrByteArrayFixed32(Uint8List(32))),
            PublicKeyKeyTypeEd25519(XdrByteArrayFixed32(Uint8List(32))),
            isBuy,
            Int64.ZERO,
            Int64.ZERO,
            Int64.ZERO,
            offerId,
            orderBookID,
            ManageOfferOpExtEmptyVersion());
}
