import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String? _message;

  EmptyView(this._message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _message ?? "",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}