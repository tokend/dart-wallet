import 'dart:typed_data';

import 'package:dart_crypto_kit/crypto_ecdsa/ecdsa_key_pair.dart';
import 'package:dart_wallet/base32check.dart';

/// Represents TokenD account defined by EcDSA private and/or public keys.
/// In this case account is a synonym of keypair.
///
/// @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm/">ECDSA</a>
/// @see <a href="https://ed25519.cr.yp.to/">Ed25519</a>
class Account {
  EcDSAKeyPair ecDSAKeyPair;

  Account(EcDSAKeyPair keyPair) {
    this.ecDSAKeyPair = keyPair;
  }

  /// Returns public key encoded by [Base32Check].
  ///
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/accounts#account-id">AccountID in the Knowledge base</a>
  String get accountId =>
      Base32Check.encodeAccountId(ecDSAKeyPair.publicKey.bytes);

  /// Returns private key seed encoded by [Base32Check].
  ///
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/accounts#account-secret-seed">Secret seed in the Knowledge base</a>
  String get secretSeed =>
      Base32Check.encodeSecretSeed(ecDSAKeyPair.privateKey);

  /// Returns public key bytes.
  Uint8List get publicKey => ecDSAKeyPair.publicKey.bytes;

  //TODO xdrPubKey
  /// Signs provided data with the account's private key.
  ///
  /// @throws SignUnavailableException if account is not capable of signing.
  ///
  /// @see canSign
  Future<Uint8List> sign(Uint8List data) async {
    return await ecDSAKeyPair.sign(data);
  }

  destroy() {
    ecDSAKeyPair.destroy();
  }

  bool isDestroyed() {
    return ecDSAKeyPair.isDestroyed();
  }
}