import 'package:flutter/material.dart';
import 'package:mashca_bus/models/line_model.dart';
import 'package:mashca_bus/pages/linebus_page.dart';
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
            return _getLineBusItem(e);
          }).toList());
  }

  _loadLinesBus() {
    _service.getLines(1, 10).then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  Widget _getLineBusItem(LineBus line) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LineBusPage(idLineBus: line.idline),
            ));
      },
      child: Card(
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColorDark,
        child: ListTile(
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.airport_shuttle),
            title: Text(line.name),
            subtitle: Text(line.operate ?? "")),
      ),
    );
  }
}