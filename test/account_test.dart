import 'package:base16/base16.dart';
import 'package:dart_wallet/account.dart' as Account;
import 'package:dart_wallet/base32check.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';
import 'package:dart_wallet/xdr/xdr_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var _accountId = "GB6ZRRKDAHUFQAGSJWMLCXL4W7OIEQNJL4NOISQUA6G23WK3OR3MGC4L";
  var _seed = "SBUFJEEK7FMWXPE4HGOWQZPHZ4V5TFKGSF664RAGT24NS662MKTQ7J6S";
  var _xdrPublicKey = "AAAAAH2YxUMB6FgA0k2YsV18t9yCQalfGuRKFAeNrdlbdHbD";
  var _data = Uint8List.fromList("TokenD is awesome".codeUnits);

  test('sign', () {
    var expectedSig =
        "1B0EBBAE618B267668A8122ECCCD2A20480BC81951EB401E0F92B613483B798763D36AEB4B0404BC2A31FA1EAD47522BBA08705AB51BA205020E67D09AE87D0E";
    Account.Account.fromSecretSeed(_seed).then((acc) => acc
        .sign(_data)
        .then((signature) => expect(base16decode(expectedSig), signature)));
  });

  test('verify valid', () {
    var sig =
        "1B0EBBAE618B267668A8122ECCCD2A20480BC81951EB401E0F92B613483B798763D36AEB4B0404BC2A31FA1EAD47522BBA08705AB51BA205020E67D09AE87D0E";

    Account.Account.fromAccountId(_accountId).then((acc) => acc
        .verifySignature(_data, Uint8List.fromList(base16decode(sig)))
        .then((isValid) => expect(isValid, true)));
  });

  test('verify invalid', () {
    Account.Account.fromSecretSeed(_seed).then((acc) => acc
        .verifySignature(Uint8List(64), Uint8List(64))
        .then((isValid) => expect(false, isValid)));
  });

  test('from seed string', () {
    Account.Account.fromSecretSeed(_seed)
        .then((acc) => expect(acc.secretSeed, _seed));
  });

  test('from seed bytes', () {
    var seed = Uint8List.fromList(List.generate(32, (index) => index + 1));
    Account.Account.fromArraySecretSeed(seed).then(
        (acc) => expect(Base32Check.encodeSecretSeed(seed), acc.secretSeed));
  });

  test('random', () {
    var first = Account.Account.random();
    var second = Account.Account.random();
    var areEqual = first == second;
    expect(areEqual, false);
  });

  test('accountId', () {
    Account.Account.fromSecretSeed(_seed)
        .then((acc) => expect(acc.accountId, _accountId));
  });

  test('decorated sign', () {
    var expectedSig =
        "W3R2wwAAAEAbDruuYYsmdmioEi7MzSogSAvIGVHrQB4PkrYTSDt5h2PTautLBAS8KjH6Hq1HUiu6CHBatRuiBQIOZ9Ca6H0O";
    Account.Account.fromSecretSeed(_seed).then((acc) => acc
        .signDecorated(_data)
        .then((decoratedSignature) =>
            expect(decoratedSignature.toBase64(), expectedSig)));
  });

  test('xdr public key', () {
    Account.Account.fromAccountId(_accountId)
        .then((acc) => acc.xdrPublicKey)
        .then((publicKey) => expect(publicKey.toBase64(), _xdrPublicKey));
  });

  test('from xdr public key', () {
    Account.Account.fromAccountId(_accountId)
        .then((acc) => acc.xdrPublicKey)
        .then((publicKey) => Account.Account.fromXdrPublicKey(
            (publicKey as PublicKeyKeyTypeEd25519)))
        .then((account) => expect(_accountId, account.accountId));
  });

  test('destroy', () async {
    var account = await Account.Account.fromSecretSeed(_seed);
    account.destroy();
    expect(account.isDestroyed(), true);
    expect(account.secretSeed, null);
  });
}
