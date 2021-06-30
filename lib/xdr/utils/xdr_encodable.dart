
import 'dart:convert';

import 'package:stellar/stellar.dart';

class XdrEncodable {
  /// Encodes object to xdr and writes it to specified XdrDataOutputStream
  toXdr(XdrDataOutputStream stream){}

  /// Returns base64 xdr representation of this object
  String toBase64() {
    var xdrOutputStream = XdrDataOutputStream();
    this.toXdr(xdrOutputStream);
    var xdrBytes = xdrOutputStream.bytes;
    return base64Encode(xdrBytes);
  }
}