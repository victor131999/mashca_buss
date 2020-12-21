  
import 'package:flutter/material.dart';
import 'package:mashca_bus/models/line_model.dart';
import 'package:mashca_bus/providers/lines_service.dart';

class LinesWidget extends StatefulWidget {
  LinesWidget({Key key}) : super(key: key);

  @override
  _LinesWidgetState createState() => _LinesWidgetState();
}

class _LinesWidgetState extends State<LinesWidget> {
  LinesBus _list;
  LinesBusService _service;

  @override
  void initState() {
    _service = new LinesBusService();
    super.initState();
    _loadLinesBus();
  }

  @override
  Widget build(BuildContext context) {
    return _list == null
        ? Center(child: Text("Cargando líneas de buses..."))
        : ListView(
            children: _list.items.map((e) {
              return ListTile(
                  trailing: Icon(Icons.arrow_drop_down),
                  leading: Icon(Icons.airport_shuttle),
                  title: Text(e.name),
                  subtitle: Text(e.operate ?? ""));
            }).toList(),
          );
  }

  _loadLinesBus() {
    _service.getLines(1, 10).then((value) {
      _list = value;
      print(_list);
      setState(() {});
    });
  }
}