import 'package:flutter/material.dart';
import 'package:mashca_bus/widgets/text_styles_widget.dart';
class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(children: [
         TextStyles.labelLarge("Sugerencias y denuncias", Colors.black)
       ],),
    );
  }
}