import 'dart:math';
import 'dart:typed_data';

import 'package:dart_wallet/utils/hashing.dart';

/// Holds network-specific parameters.
class NetworkParams {
  ///Default amount precision in TokenD.
  static const DEFAULT_PRECISION = 6;
  static const serialVersionUID = 5677019745177892600;

  /// Passphrase of the network
  String passphrase;

  /// Decimal places in amounts. For example, 0.000001 in 6 precision is 1
  int precision;

  ///Multiplier for precised amount conversions
  ///See [precision]
  int precisionMultiplier;

  ///Identifier of the network
  Uint8List networkId;

  ///Offset between device and server time in seconds
  int timeOffsetSeconds;

  ///Calculated current time on server as a UNIX timestamp
  ///See [timeOffsetSeconds]
  int get nowTimestamp =>
      (DateTime.now().millisecondsSinceEpoch / 1000).ceil() + timeOffsetSeconds;

  ///[passphrase] network passphrase
  /// [precision] decimal places in amounts, [DEFAULT_PRECISION] by default
  /// [timeOffsetSeconds] offset between device and server time in seconds, 0 by default
  NetworkParams(this.passphrase,
      {this.precision = DEFAULT_PRECISION, this.timeOffsetSeconds}) {
    this.precisionMultiplier = pow(10, precision);
    this.networkId =
        Hashing().sha256hashing(Uint8List.fromList(passphrase.codeUnits));
    this.timeOffsetSeconds = timeOffsetSeconds;
  }

  /// Converts given amount to network format.
  /// See [precision]
  int amountToPrecised(double amount) {
    return (amount * precisionMultiplier).round();
  }

  ///Converts given amount from network format to human-readable.
  double amountFromPrecised(int amount) {
    return amount / precisionMultiplier;
  }
}