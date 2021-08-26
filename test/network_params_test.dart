import 'package:dart_wallet/network_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('amount conversion', () {
    var precision = 6;
    var amount = 1.234567;
    var networkParams = NetworkParams("Test phrase", precision: precision);

    var precisedAmount = networkParams.amountToPrecised(amount);
    var dePrecisedAmount = networkParams.amountFromPrecised(precisedAmount);

    expect(amount, dePrecisedAmount);
  });

  test('time correction', () {
    var correction = 60;
    var networkParams = NetworkParams("Test phrase",
        precision: NetworkParams.DEFAULT_PRECISION,
        timeOffsetSeconds: correction);

    var actual = DateTime.now().millisecondsSinceEpoch / 1000;
    var calculated = networkParams.nowTimestamp;

    var isCorrect = (calculated - actual) >= correction - 1 &&
        (calculated - actual) <= correction + 1;
    expect(isCorrect, true);
  });

  test('time correction', () {
    var correction = 60;
    var networkParams = NetworkParams("Test phrase",
        precision: NetworkParams.DEFAULT_PRECISION,
        timeOffsetSeconds: correction);

    var actual = DateTime.now().millisecondsSinceEpoch / 1000;
    var calculated = networkParams.nowTimestamp;

    var isCorrect = (calculated - actual) >= correction - 1 &&
        (calculated - actual) <= correction + 1;
    expect(isCorrect, true);
  });
}
