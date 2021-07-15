import 'dart:typed_data';

import 'package:stellar/stellar.dart';
import 'package:fixnum/fixnum.dart';

extension XdrIntPrimitive on int {
  toXdr(XdrDataOutputStream stream) {
    stream.writeInt(this);
  }
}

extension aa on Int64 {
  toXdr(XdrDataOutputStream stream) {
    stream.writeLong(this.toInt());
  }
}

extension XdrStringPrimitive on String {
  toXdr(XdrDataOutputStream stream) {
    stream.writeString(this);
  }
}

extension XdrBooleanPrimitive on bool {
  toXdr(XdrDataOutputStream stream) {
    var boolAsInt;
    if (this) {
      boolAsInt = 1;
    } else {
      boolAsInt = 0;
    }
    stream.writeInt(boolAsInt);
  }
}

extension XdrOpaquePrimitive on Uint8List {
  toXdr(XdrDataOutputStream stream) {
    stream.writeIntArray(this);
  }

  Uint8List fromXdr(XdrDataInputStream stream) {
    return Uint8List.fromList(stream.readIntArray());
  }
}