class VersionByte {
  static const ACCOUNT_ID = 48;
  static const SEED = 144;
  static const BALANCE_ID = 8;

  int value;

  VersionByte(this.value);

  int getValue() {
    return value;
  }

  static VersionByte? valueOf(int value) {
    if (value == ACCOUNT_ID) {
      return VersionByte(ACCOUNT_ID);
    } else if (value == SEED) {
      return VersionByte(SEED);
    } else if (value == BALANCE_ID) {
      return VersionByte(BALANCE_ID);
    } else {
      return null;
    }
  }
}