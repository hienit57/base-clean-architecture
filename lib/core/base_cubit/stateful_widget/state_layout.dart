import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:metaway_holdings/core/base_cubit/stateful_widget/state_error_view.dart';
import 'package:metaway_holdings/core/network/exceptions/error_exception.dart';

import 'empty_view.dart';

enum StateLayout { showContent, showLoading, showError, showEmpty }

class StateFullLayout extends StatelessWidget {
  final StateLayout stateLayout;
  final ErrorException error;
  final Function() retry;
  final String textEmpty;

  const StateFullLayout(
      {Key? key,
      required this.stateLayout,
      required this.error,
      required this.retry,
      required this.textEmpty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (stateLayout == StateLayout.showError) {
      return StateErrorView(message: error.message, retry: retry);
    }
    if (stateLayout == StateLayout.showEmpty) {
      return EmptyView(textEmpty);
    }

    if (stateLayout == StateLayout.showLoading) {
      return const LoadingIndicator(
          indicatorType: Indicator.ballPulse,

          /// Required, The loading type of the widget
          colors: [Colors.white],

          /// Optional, The color collections
          strokeWidth: 2,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          backgroundColor: Colors.black,

          /// Optional, Background of the widget
          pathBackgroundColor: Colors.black

          /// Optional, the stroke backgroundColor
          );
    } else {
      return EmptyView(textEmpty);
    }
  }
}
