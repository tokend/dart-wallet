extension ShiftsExtension on int {
  int zeroFillRightShift(int amount) {
    return (this & 0xffffffff) >> amount;
  }
}
