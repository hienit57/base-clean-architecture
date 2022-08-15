import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CLoadingIndicator extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? bgColor;
  final List<Color>? colorLoading;

  const CLoadingIndicator(
      {Key? key, this.width, this.height, this.bgColor, this.colorLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? Colors.white.withOpacity(0.9),
      alignment: Alignment.center,
      child: SizedBox(
        width: width ?? 30,
        height: height ?? 30,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScalePulseOutRapid,

          /// Required, The loading type of the widget
          colors: colorLoading ?? [],

          /// Optional, The color collections
          //strokeWidth: 20,
          /// Optional, The stroke of the line, only applicable to widget which contains line
          backgroundColor: bgColor ?? Colors.white,

          /// Optional, Background of the widget
          //pathBackgroundColor: Colors.yellow
          /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
