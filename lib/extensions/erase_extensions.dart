import 'dart:typed_data';

extension Erase on Uint8List {
  erase() {
    this.fillRange(0, this.length, 0);
  }
}

extension EraseString on String {
  String erase() {
    var erasedString = '';
    for (int i = 0; i < this.length; i++) {
      erasedString += '0';
    }
    return erasedString;
  }
}
