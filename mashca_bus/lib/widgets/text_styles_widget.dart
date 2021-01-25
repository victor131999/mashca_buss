import 'package:flutter/material.dart';

class Labels {
  static Widget headline3(BuildContext context, String message,
      [Color color1 = Colors.black]) {
    return Text(message,
        style: Theme.of(context).textTheme.headline3.apply(color: color1));
  }
}