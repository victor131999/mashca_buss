import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mashca_bus/models/report_model.dart';
import 'package:mashca_bus/providers/report_service.dart';
import 'package:mashca_bus/utils/utils.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Report _report = new Report();
  String _typeValue = typesReport.elementAt(0); //'Sugerencia';
  ReportService _service = new ReportService();
  File _image;
  final picker = ImagePicker();
  bool _onSaving = false;

  @override
  Widget build(BuildContext context) {
    _report.type = _typeValue;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(14.0),
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    _showImage(),
                    _getImageButtons(),
                    _getFieldMessage(),
                    _getTypesReport(),
                    _getSubmitButton()
                  ])))),
    );
  }

  Widget _getFieldMessage() {
    return TextFormField(
      initialValue: _report.message,
      decoration: InputDecoration(labelText: "Mensaje"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _report.message = value;
      },
      validator: (value) {
        if (value.length < 20) {
          return "Debe ingresar un mensaje con al menos 20 caracteres";
        } else {
          return null; //Validación se cumple al retorna null
        }
      },
    );
  }

  Widget _getTypesReport() {
    return Column(
        children: typesReport
            .map((e) => ListTile(
                  title: Text(e),
                  leading: Radio(
                    value: e,
                    groupValue: _typeValue,
                    onChanged: (String value) {
                      setState(() {
                        _typeValue = value;
                      });
                    },
                  ),
                ))
            .toList());
  }

  Widget _getSubmitButton() {
    return Container(
        color: Theme.of(context).buttonColor,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(Icons.send),
                onPressed: _onSaving ? null : _submitForm)
          ],
        ));
  }

  Widget _getImageButtons() {
    return Container(
      color: Theme.of(context).buttonColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(icon: Icon(Icons.image), onPressed: _pickupImage),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: _takeImage),
        ],
      ),
    );
  }

  _submitForm() async {
    if (!formKey.currentState.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState.save();

    setState(() {
      _onSaving = true;
    });

    if (_image != null) {
      _report.image = await _service.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _service.post(_report).then((value) {
      if (value != null) {
        formKey.currentState.reset();
        _image = null;
        scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(value.text)),
        );
        setState(() {
          _onSaving = false;
        });
      }
    });
  }

  _showImage() {
    if (_image != null) {
      return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.file(_image));
    }
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Image.asset('assets/images/no-image.png'));
  }

  _pickupImage() {
    _selectImage(ImageSource.gallery);
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}