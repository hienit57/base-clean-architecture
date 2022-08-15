import 'package:flutter/material.dart';

extension IntExtensions on int {
  //Screen Utils
  /// Leaves given height of space
  Widget get h => SizedBox(height: toDouble());

  /// Leaves given width of space
  Widget get w => SizedBox(width: toDouble());
}
