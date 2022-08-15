// ignore_for_file: sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:base_clean_architecture/widget/style/font_colors.dart';

mixin CShowDialogsMixin {
  cShowDialog(BuildContext context,
      {double? width,
      double? height,
      Widget? child,
      VoidCallback? onPressed,
      String? title,
      String? content,
      bool? barrierDismissible,
      Widget? childChangeContent}) {
    showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: barrierDismissible ?? true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.center,
            child: IntrinsicHeight(
              child: Container(
                width: width ?? 300,
                height: height ?? 391,
                child: child,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context);
  }

  dialogExt(
    BuildContext context, {
    double? width,
    double? height,
    Widget? child,
    VoidCallback? onPressed,
    String? title,
    String? content,
    Widget? childChangeContent,
  }) {
    showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.33),
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (_, __, ___) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Align(
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: LoadingIndicator(
                        indicatorType: Indicator.lineScalePulseOutRapid,
                        colors: [
                          ColorsApp.color_FFCB08,
                          ColorsApp.color_979797,
                          ColorsApp.color_FFCB08,
                          ColorsApp.color_979797,
                          ColorsApp.color_FFCB08,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  cShowDialogWarning(
    BuildContext context, {
    double? width,
    double? height,
    Widget? child,
    bool? barrierDismissible,
    Widget? childChangeContent,
  }) {
    showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: barrierDismissible ?? true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              width: width ?? 300,
              height: height ?? 391,
              child: child,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        });
  }
}
