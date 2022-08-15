import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/flutter_svg.dart';

class CImage extends StatefulWidget {
  final String? assetsPath;
  final String? assetsNetworkUrl;
  final String? svgPath;
  final String? svgNetworkUrl;
  final double? radius;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final Color? color;
  final VoidCallback? onTap;

  const CImage({
    Key? key,
    this.assetsPath,
    this.assetsNetworkUrl,
    this.width,
    this.height,
    this.radius,
    this.boxFit,
    this.color,
    this.svgPath,
    this.svgNetworkUrl,
    this.onTap,
  }) : super(key: key);
  @override
  _CImageState createState() => _CImageState();
}

class _CImageState extends State<CImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (() {
        if (kIsWeb) {
          return GestureDetector(
            onTap: widget.onTap,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                child: Image.asset(
                  widget.assetsPath ?? '',
                  height: widget.height,
                  width: widget.width,
                  fit: widget.boxFit ?? BoxFit.fill,
                )),
          );
        } else {
          if (widget.assetsPath == null) {
            return GestureDetector(
              onTap: widget.onTap,
              child: SvgPicture.asset(
                widget.svgPath ?? '',
                width: widget.width,
                height: widget.height,
                fit: widget.boxFit ?? BoxFit.cover,
                color: widget.color,
              ),
            );
          } else {
            return GestureDetector(
              onTap: widget.onTap,
              child: Image.asset(
                widget.assetsPath ?? '',
                height: widget.height,
                width: widget.width,
                fit: widget.boxFit ?? BoxFit.fill,
              ),
            );
          }
        }
      }()),
    );
  }
}
