import 'dart:typed_data';

import 'package:stellar/stellar.dart';

int intFromXdr(XdrDataInputStream stream) {
  return stream.readInt();
}

String stringFromXdr(XdrDataInputStream stream) {
  return stream.readString();
}

bool boolFromXdr(XdrDataInputStream stream) {
  return stream.readInt() == 1;
}

Uint8List opaqueFromXdr(XdrDataInputStream stream) {
  return Uint8List.fromList(stream.readIntArray());
}