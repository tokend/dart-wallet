import 'dart:typed_data';

import 'package:dart_wallet/xdr/utils/xdr_data_input_stream.dart';
import 'package:dart_wallet/xdr/utils/xdr_data_output_stream.dart';
import 'package:fixnum/fixnum.dart';

extension XdrIntPrimitive on int {
  toXdr(XdrDataOutputStream stream) {
    stream.writeInt(this);
  }
}

extension XdrLongPrimitive on Int64 {
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
    this.length.toXdr(stream);
    stream.write(this);
  }

  Uint8List fromXdr(XdrDataInputStream stream) {
    return Uint8List.fromList(stream.readIntArray());
  }
}
