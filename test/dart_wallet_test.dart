import 'package:flutter_test/flutter_test.dart';

import 'package:dart_wallet/dart_wallet.dart';

void main() {
  test('adds one to input values', () {
    var list = List.generate(4, (index) => index + 1);
    print(list);
    var sublist = list.sublist(1,3);
    print(sublist);
    print(list);

    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
