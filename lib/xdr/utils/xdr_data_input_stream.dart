import "dart:convert";
import 'dart:typed_data';

import 'package:dart_wallet/xdr/utils/dart_input.dart';

class XdrDataInputStream extends DataInput {
  XdrDataInputStream(Uint8List data) : super.fromUint8List(data);

  int read() {
    return readByte();
  }

  String readString() {
    int length = readInt();
    List<int> bytes = readBytes(length);
    return utf8.decode(bytes);
  }

  List<int> readIntArray() {
    var l = readInt();
    var result = List.generate(l, (index) => 0);
    for (int i = 0; i < l; i++) {
      result[i] = readInt();
    }
    return result;
  }

  List<double> readFloatArray() {
    var l = readInt();
    var result = List<double>.generate(l, (index) => 0);
    for (int i = 0; i < l; i++) {
      result[i] = readFloat();
    }
    return result;
  }

  List<double> readDoubleArray() {
    var l = readInt();
    var result = List<double>.generate(l, (index) => 0);
    for (int i = 0; i < l; i++) {
      result[i] = readDouble();
    }
    return result;
  }
}
