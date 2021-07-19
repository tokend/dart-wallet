import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class CreateOfferOp extends ManageOfferOp {
  CreateOfferOp(BALANCEID baseBalanceId, BALANCEID quoteBalance, INT64 amount,
      INT64 price, INT64 fee, bool isBuy, {UINT64 orderBookID = Int64.ZERO})
      : super(
      baseBalanceId,
      quoteBalance,
      isBuy,
      amount,
      price,
      fee,
      Int64.ZERO,
      orderBookID,
      ManageOfferOpExtEmptyVersion());

  CreateOfferOp.fromPubKey(String baseBalanceId, String quoteBalance, INT64 amount,
      INT64 price, INT64 fee, bool isBuy, {UINT64 orderBookID = Int64.ZERO})
      : this (PublicKeyFactory.fromBalanceId(baseBalanceId),
      PublicKeyFactory.fromBalanceId(quoteBalance),
      amount, price, fee, isBuy, orderBookID: orderBookID);
}
