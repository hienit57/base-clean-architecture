import 'package:flutter/material.dart';
import 'package:base_clean_architecture/widget/style/font_colors.dart';
import 'package:base_clean_architecture/widget/style/font_size.dart';

class CText extends StatelessWidget {
  final double? width;
  final GestureTapCallback? onTap;
  final String? text;
  final EdgeInsets? padding;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Gradient? gradient;
  final List<Color>? colorGradient;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? lineHeight;
  final double? wordSpacing;
  final String? fontFamily;

  const CText(
    this.text, {
    Key? key,
    this.textOverflow,
    this.padding,
    this.style,
    this.textAlign,
    this.onTap,
    this.width,
    this.maxLines,
    this.gradient,
    this.colorGradient,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.lineHeight,
    this.wordSpacing,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _text = Text(
      text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? FontSize.FONTSIZE_14,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? 'Plus Jakarta Sans',
        color: textColor,
        height: lineHeight,
        wordSpacing: wordSpacing,
        foreground: textColor == null
            ? (Paint()
              ..shader = LinearGradient(
                colors: colorGradient ??
                    [
                      ColorsApp.color_000000,
                      ColorsApp.color_FFFFFF,
                    ],
              ).createShader(const Rect.fromLTWH(83.0, 92.0, 209.0, 36.0)))
            : null,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: padding ?? EdgeInsets.all(0),
          child: _text,
        ),
      ),
    );
  }
}
