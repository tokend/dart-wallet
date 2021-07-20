import 'dart:convert';

import 'package:dart_wallet/xdr/utils/xdr_data_input_stream.dart';

class XdrDecodable<T> {
  /// Decodes object of type [T] from XDR content of the [stream]
  T? fromXdr(XdrDataInputStream stream) {}

  /// Decodes object of type [T] from Base64-encoded XDR content
  T? fromBase64(String xdrBase64) {
    return fromXdr(XdrDataInputStream(base64Decode(xdrBase64)));
  }
}