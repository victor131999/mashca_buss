import 'package:flutter/material.dart';
import 'package:mashca_bus/models/line_model.dart';
import 'package:mashca_bus/providers/lines_service.dart';

class LineBusPage extends StatefulWidget {
  final String idLineBus;
  LineBusPage({Key key, @required this.idLineBus}) : super(key: key);

  @override
  _LineBusPageState createState() => _LineBusPageState();
}

class _LineBusPageState extends State<LineBusPage> {
  LineBus _currentLine;
  LinesBusService _service;

  @override
  void initState() {
    super.initState();
    _service = new LinesBusService();
    _loadLineBus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentLine == null
            ? Center(
                child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator()))
            : CustomScrollView(
                slivers: [
                  _appBar(_currentLine.name),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Text(_currentLine.operate),
                    SizedBox(height: 15.0),
                    Text(_currentLine.start.name),
                    Text(_currentLine.finish.name),
                    SizedBox(height: 550.0),
                    Text(_currentLine.finish.name),
                    Text(_currentLine.finish.name),
                    Text(_currentLine.finish.name),
                    Text(_currentLine.finish.name),
                    Text(_currentLine.finish.name),
                  ]))
                ],
              ));
  }

  Widget _appBar(String title) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title),
          background: FadeInImage(
              placeholder: AssetImage("assets/images/latacunga.jpg"),
              fadeInDuration: Duration(seconds: 2),
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/7/74/Latacunga_Municipio_2012.jpg"),
              fit: BoxFit.cover),
        ));
  }

  _loadLineBus() {
    _service.getLine(widget.idLineBus).then((value) {
      _currentLine = value;
      print(_currentLine);
      setState(() {});
    });
  }
}