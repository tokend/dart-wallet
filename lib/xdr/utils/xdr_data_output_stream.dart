import "dart:convert";

import 'package:dart_wallet/xdr/utils/data_output.dart';

class XdrDataOutputStream extends DataOutput {
  writeString(String s) {
    if (s == null) throw ArgumentError("String cannot be null");
    List<int> bytesNeeded = utf8.encode(s);
    if (bytesNeeded.length > 65535)
      throw FormatException("Length cannot be greater than 65535");
    writeInt(bytesNeeded.length);
    write(bytesNeeded);
  }

  writeIntArray(List<int> a) {
    writeInt(a.length);
    for (int i = 0; i < a.length; i++) {
      writeInt(a[i]);
    }
  }

  writeFloatArray(List<double> a) {
    writeInt(a.length);
    for (int i = 0; i < a.length; i++) {
      writeFloat(a[i]);
    }
  }

  writeDoubleArray(List<double> a) {
    writeInt(a.length);
    for (int i = 0; i < a.length; i++) {
      writeDouble(a[i]);
    }
  }
}
