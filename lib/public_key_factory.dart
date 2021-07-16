import 'package:dart_wallet/base32check.dart';

import 'xdr/xdr_types.dart';

/// Holds method to create XDR public keys from
/// [Base32Check] encoded string representations.
class PublicKeyFactory {
  /// Creates [PublicKey] from [Base32Check] encoded balance ID.
  static BALANCEID fromBalanceId(String balanceId) {
    return PublicKeyKeyTypeEd25519(
        UINT256(Base32Check.decodeBalanceId(balanceId)));
  }

  /// Creates [PublicKey] from [Base32Check] encoded account ID.
  static ACCOUNTID fromAccountId(String accountId) {
    return PublicKeyKeyTypeEd25519(
        UINT256(Base32Check.decodeAccountId(accountId)));
  }
}
