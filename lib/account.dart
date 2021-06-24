import 'package:dart_crypto_kit/crypto_ecdsa/ecdsa_key_pair.dart';
/// Represents TokenD account defined by EcDSA private and/or public keys.
/// In this case account is a synonym of keypair.
///
/// @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm/">ECDSA</a>
/// @see <a href="https://ed25519.cr.yp.to/">Ed25519</a>
class Account {
  EcDSAKeyPair ecDSAKeyPair;

  Account(this.ecDSAKeyPair);

  String accountId;
}