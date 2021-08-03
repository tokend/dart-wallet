import 'dart:typed_data';

import 'package:dart_wallet/xdr/utils/xdr_encodable.dart';
import 'package:dart_wallet/xdr/utils/dependencies.dart';

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
  var size = stream.readInt();
  return Uint8List.fromList(stream.readBytes(size));
}

Int64 longFromXdr(XdrDataInputStream stream) {
  var r = stream.readLong();
  return Int64(r);
}

abstract class XdrFixedByteArray extends XdrEncodable {
  abstract int size;
  late Uint8List wrapped;

  set setWrapped(Uint8List value) {
    if (value.length == size) {
      wrapped = value;
    } else if (value.length > size) {
      wrapped =
          Uint8List.fromList(value.getRange(0, wrapped.length - 1).toList());
    } else if (value.length < size) {
      wrapped = Uint8List(wrapped.length);
      for (int i = 0; i < value.length; i++) {
        wrapped[i] = value[i];
      }
    }
  }

  XdrFixedByteArray(Uint8List wrapped) {
    this.setWrapped = wrapped;
  }

  @override
  toXdr(XdrDataOutputStream stream) {
    stream.write(wrapped);
  }

  static XdrFixedByteArray fromXdr(XdrDataInputStream stream, int size) {
    return XdrByteArrayFixed32(stream.readBytes(size));
  }
}
