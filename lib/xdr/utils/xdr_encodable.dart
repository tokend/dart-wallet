import 'dart:convert';

import 'package:dart_wallet/xdr/utils/xdr_data_output_stream.dart';

class XdrEncodable {
  /// Encodes object to xdr and writes it to specified XdrDataOutputStream
  toXdr(XdrDataOutputStream stream) {}

  /// Returns base64 xdr representation of this object
  String toBase64() {
    var xdrOutputStream = XdrDataOutputStream();
    this.toXdr(xdrOutputStream);
    var xdrBytes = xdrOutputStream.bytes;
    return base64Encode(xdrBytes);
  }
}
