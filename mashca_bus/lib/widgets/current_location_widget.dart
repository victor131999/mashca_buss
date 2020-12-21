import 'package:flutter/material.dart';
import 'package:mashca_bus/widgets/text_styles_widget.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _heigth=MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: _heigth * 0.33,
            child:Container(
              color: Colors.amber,
            )  
          ),
          TextStyles.labelLarge('Paradas cercanas')
        ],),
    );
  }
}