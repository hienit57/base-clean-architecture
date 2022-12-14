// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CContainer extends StatefulWidget {
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final BoxBorder? border;

  const CContainer(
      {Key? key,
      this.backgroundColor,
      this.radius,
      this.borderColor,
      this.borderWidth,
      this.height,
      this.width,
      this.child,
      this.onTap,
      this.padding,
      this.margin,
      this.border})
      : super(key: key);

  @override
  _CContainerState createState() => _CContainerState();
}

class _CContainerState extends State<CContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: widget.margin ?? const EdgeInsets.all(0),
        padding: widget.padding ?? const EdgeInsets.all(0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.radius ?? 0.0),
          border: widget.border,
        ),
        child: widget.child ?? const SizedBox(),
      ),
    );
  }
}
