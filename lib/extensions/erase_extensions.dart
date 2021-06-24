import 'dart:typed_data';

extension Erase on Uint8List {
  erase() {
    this.fillRange(0, this.length, 0);
  }
}