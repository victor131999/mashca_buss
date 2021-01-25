import 'package:flutter/material.dart';
import 'package:mashca_bus/widgets/text_styles_widget.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
                height: _heigth * 0.33,
                child: Container(
                  color: Colors.amber,
                )),
            Text("headline1", style: Theme.of(context).textTheme.headline1),
            Text("headline2", style: Theme.of(context).textTheme.headline2),
            Text("headline3", style: Theme.of(context).textTheme.headline3),
            Text("headline4", style: Theme.of(context).textTheme.headline4),
            Text("headline5", style: Theme.of(context).textTheme.headline5),
            Text("headline6", style: Theme.of(context).textTheme.headline6),
            Text("bodyText1", style: Theme.of(context).textTheme.bodyText1),
            Text("bodyText2", style: Theme.of(context).textTheme.bodyText2),
            Text("subtitle1", style: Theme.of(context).textTheme.subtitle1),
            Text("subtitle2", style: Theme.of(context).textTheme.subtitle2),
            Text("caption", style: Theme.of(context).textTheme.caption),
            Labels.headline3(context, "Message 1"),
            Labels.headline3(
                context, "Message 1", Theme.of(context).accentColor),
          ],
        ),
      ),
    );
  }
}