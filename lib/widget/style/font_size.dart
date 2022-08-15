// ignore_for_file: non_constant_identifier_names

abstract class FontSize {
  static double get FONTSIZE_1 => 1;
  static double get FONTSIZE_2 => 2;
  static double get FONTSIZE_3 => 3;
  static double get FONTSIZE_4 => 4;
  static double get FONTSIZE_5 => 5;
  static double get FONTSIZE_6 => 6;
  static double get FONTSIZE_7 => 7;
  static double get FONTSIZE_8 => 8;
  static double get FONTSIZE_9 => 9;
  static double get FONTSIZE_10 => 10;
  static double get FONTSIZE_11 => 11;
  static double get FONTSIZE_12 => 12;
  static double get FONTSIZE_13 => 13;
  static double get FONTSIZE_14 => 14;
  static double get FONTSIZE_15 => 15;
  static double get FONTSIZE_16 => 16;
  static double get FONTSIZE_17 => 17;
  static double get FONTSIZE_18 => 18;
  static double get FONTSIZE_19 => 19;
  static double get FONTSIZE_20 => 20;
  static double get FONTSIZE_24 => 24;
  static double get FONTSIZE_36 => 36;

  FontSize._();
}

double flowSizeWidth(double size) {
  return size / 375;
}

double flowSizeHeight(double size) {
  return size / 812;
}
