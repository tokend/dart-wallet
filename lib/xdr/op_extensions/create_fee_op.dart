import 'package:dart_wallet/xdr/op_extensions/simple_set_fees_op.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';
import 'package:fixnum/fixnum.dart';

class CreateFeeOp extends SimpleSetFeesOp {
  CreateFeeOp(FeeType type, String asset, Int64 fixed, Int64 percent,
      Int64 upperBound, Int64 lowerBound)
      : super(false, type, asset, fixed, percent, upperBound, lowerBound);
}
