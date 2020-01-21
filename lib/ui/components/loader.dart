import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final Color color;
  CustomLoader({this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(backgroundColor: this.color),
    );
  }
}
