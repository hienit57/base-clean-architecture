import 'package:flutter/material.dart';
import 'package:metaway_holdings/widget/c_text.dart';
import 'package:metaway_holdings/widget/style/font_colors.dart';

class CButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final String? title;
  final Color? titleColor;
  final double? borderRadius;

  const CButton({
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.title,
    this.titleColor,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Center(
          child: Center(
        child: CText(
          title,
          fontWeight: FontWeight.w600,
          textColor: ColorsApp.color_FFFFFF,
        ),
      )),
    );
  }
}
