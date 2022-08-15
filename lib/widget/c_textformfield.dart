// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextFormField extends StatefulWidget {
  final String? hintText;
  final Color? hintColor;
  final bool? obscureText;
  final int? maxLine;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? textInputType;
  final EdgeInsets? contentPadding;
  final double? contentSize;
  final FontWeight? fontWeight;
  final VoidCallback? onComplete;
  final void Function(String)? onchanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CTextFormField({
    this.controller,
    this.hintText,
    this.onchanged,
    this.suffixIcon,
    this.obscureText,
    this.textInputFormatter,
    this.prefixIcon,
    this.textInputType,
    this.contentPadding,
    this.contentSize,
    this.hintColor,
    this.maxLine,
    this.fontWeight,
    this.onComplete,
  });

  @override
  _CTextFormFieldState createState() => _CTextFormFieldState();
}

class _CTextFormFieldState extends State<CTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      inputFormatters: widget.textInputFormatter,
      //textInputAction: TextInputAction.next,
      onChanged: widget.onchanged,
      onFieldSubmitted: (_) {},
      obscureText: widget.obscureText ?? false,
      maxLines: widget.maxLine,
      onEditingComplete: widget.onComplete,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontWeight: widget.fontWeight,
          fontSize: widget.contentSize,
          fontFamily: 'OpenSans',
        ),
        contentPadding: widget.contentPadding,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
