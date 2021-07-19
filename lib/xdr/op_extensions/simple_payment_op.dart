import 'package:dart_wallet/public_key_factory.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';

class SimplePaymentOp extends PaymentOp {
  SimplePaymentOp(BALANCEID sourceBalanceID, ACCOUNTID destinationAccountId,
      UINT64 amount, PaymentFeeData feeData,
      {LONGSTRING subject = "", LONGSTRING reference = ""})
      : super(
            sourceBalanceID,
            PaymentOpDestinationAccount(destinationAccountId),
            amount,
            feeData,
            subject,
            reference,
            PaymentOpExtEmptyVersion());

  SimplePaymentOp.FromPubKeys(String sourceBalanceID, String destination,
      UINT64 amount, PaymentFeeData feeData,
      {LONGSTRING subject = "", LONGSTRING reference = ""})
      : this(
          PublicKeyFactory.fromBalanceId(sourceBalanceID),
          PublicKeyFactory.fromAccountId(destination),
          amount,
          feeData,
          subject: subject,
          reference: reference,
        );
}
