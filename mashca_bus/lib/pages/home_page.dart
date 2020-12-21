import 'package:flutter/material.dart';
import 'package:mashca_bus/widgets/current_location_widget.dart';
import 'package:mashca_bus/widgets/form_widget.dart';
import 'package:mashca_bus/widgets/lines_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageStorageBucket _bucket = PageStorageBucket();
  int _selectedIndex = 0;
  String _mainTitle = "My App Mascha Bus";

  final List<String> _titles = [
    'Tu ubicación',
    'Paradas',
    'Sugerencias y denuncias'
  ];

  final List<Widget> _pages = [
    CurrentLocationWidget(
      key: PageStorageKey('CurrentLocation'),
    ),
    LinesWidget(
      key: PageStorageKey('Lines'),
    ),
    FormWidget(
      key: PageStorageKey('Form'),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_mainTitle),
      ),
      body: PageStorage(bucket: _bucket, child: _pages[_selectedIndex]),
      floatingActionButton: FloatingActionButton(
          child: Container(child: Icon(Icons.ac_unit)),
          onPressed: () {
            setState(() {
              _mainTitle = _titles[_selectedIndex];
            });
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            title: Text('Tu ubicación'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle),
            title: Text('Líneas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            title: Text('Sugerencias'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}