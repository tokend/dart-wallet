import 'dart:typed_data';

import 'package:dart_crypto_kit/crypto_ecdsa/ecdsa_key_pair.dart';
import 'package:dart_wallet/base32check.dart';
import 'package:dart_wallet/extensions/erase_extensions.dart';
import 'package:dart_wallet/xdr/xdr_types.dart' as Types;

/// Represents TokenD account defined by EcDSA private and/or public keys.
/// In this case account is a synonym of keypair.
///
/// See <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm/">ECDSA</a>
/// See <a href="https://ed25519.cr.yp.to/">Ed25519</a>
class Account {
  late EcDSAKeyPair ecDSAKeyPair;

  Account(EcDSAKeyPair keyPair) {
    this.ecDSAKeyPair = keyPair;
  }

  /// Returns public key encoded by [Base32Check].
  ///
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/accounts#account-id">AccountID in the Knowledge base</a>
  String get accountId => Base32Check.encodeAccountId(
      Uint8List.fromList(ecDSAKeyPair.publicKey.bytes));

  /// Returns private key seed encoded by [Base32Check].
  ///
  /// See <a href="https://tokend.gitbook.io/knowledge-base/technical-details/key-entities/accounts#account-secret-seed">Secret seed in the Knowledge base</a>
  String? get secretSeed {
    if(ecDSAKeyPair.privateKey != null) {
      return Base32Check.encodeSecretSeed(
          Uint8List.fromList(ecDSAKeyPair.privateKey!));
    }
    return null;
  }

  /// Returns public key bytes.
  List<int> get publicKey => ecDSAKeyPair.publicKey.bytes;

  /// @return public key wrapped into XDR.
  Types.PublicKey get xdrPublicKey => Types.PublicKeyKeyTypeEd25519(
      Types.UINT256(Uint8List.fromList(publicKey)));

  /// Signs provided data with the account's private key.
  /// @throws SignUnavailableException if account is not capable of signing.
  /// @see canSign
  Future<Uint8List> sign(Uint8List data) async {
    return Uint8List.fromList(new List.from(await ecDSAKeyPair.sign(data)));
  }

  destroy() {
    ecDSAKeyPair.destroy();
  }

  bool isDestroyed() {
    return ecDSAKeyPair.isDestroyed();
  }

  /// Verifies provided data and signature with the account's public key.
  Future<bool> verifySignature(Uint8List data, Uint8List signature) {
    return EcDSAKeyPair.verify(data, signature, ecDSAKeyPair.publicKey);
  }

  /// Signs provided data with the account's private key
  /// and wraps the signature into XDR.
  ///
  /// @see sign
  Future<Types.DecoratedSignature> signDecorated(Uint8List data) async {
    return Types.DecoratedSignature(_getSignatureHint(), await sign(data));
  }

  Types.SIGNATUREHINT _getSignatureHint() {
    var signatureHintBytes =
        publicKey.sublist(publicKey.length - 4, publicKey.length);
    return Types.SIGNATUREHINT(Uint8List.fromList(signatureHintBytes));
  }

  /// Creates an account from a secret seed.
  ///
  /// @param seed [Base32Check] encoded private key seed. Will be decoded and duplicated
  /// so can be erased after account creation.
  ///
  /// @see Base32Check
  /// @see Account.secretSeed
  static Future<Account> fromSecretSeed(String seed) async {
    var decoded = Base32Check.decodeSecretSeed(seed);
    var keypair = await fromArraySecretSeed(decoded);
    decoded.erase();
    return keypair;
  }

  /// Creates an account from a raw 32 byte secret seed.
  ///
  /// @param seed 32 bytes of the private key seed. Will be duplicated.
  static Future<Account> fromArraySecretSeed(Uint8List seed) async {
    var keypair = await EcDSAKeyPair.fromPrivateKeySeed(seed);
    return Account(keypair);
  }

  /// Creates an account from an account ID.
  /// Created account can be used only for signature verification
  /// as soon as it has no private key.
  /// [accountId] is [Base32Check] encoded public key.
  ///
  /// See [Base32Check]
  /// See [Account.accountId]
  /// See verifySignature
  static Future<Account> fromAccountId(String accountId) {
    var decoded = Base32Check.decodeAccountId(accountId);
    return fromPublicKey(decoded);
  }

  /// Creates an account from a raw 32 byte public key.
  /// [publicKey] is 32 bytes of the public key.
  /// See [Account.publicKey]
  static Future<Account> fromPublicKey(Uint8List publicKey) async {
    var keypair = EcDSAKeyPair.fromPublicKeyBytes(publicKey);
    return Account(keypair);
  }

  /// Creates an account from an XDR-wrapped public key.
  /// @param publicKey XDR-wrapped public key.
  static Future<Account> fromXdrPublicKey(Types.PublicKeyKeyTypeEd25519 publicKey) {
    return Account.fromPublicKey(publicKey.ed25519.wrapped);
  }

  /// Creates an account from a random private key.
  static Future<Account> random() async {
    var randomKeyPair = await EcDSAKeyPair.random();
    return Account(randomKeyPair);
  }
}
