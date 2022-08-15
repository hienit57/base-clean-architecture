import 'package:flutter/material.dart';
import 'package:metaway_holdings/widget/c_button.dart';

class StateErrorView extends StatelessWidget {
  final String message;
  final Function() retry;

  const StateErrorView({Key? key, required this.message, required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
          ),
          CButton(
            height: 40,
            width: 90,
          ),
        ],
      ),
    );
  }
}
