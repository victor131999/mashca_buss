import 'dart:convert';
import 'package:mashca_bus/models/line_model.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class LinesBusService {
  String _urlRoot = "https://ejercicio-web-avanzado-7828.web.app/api";

  LinesBusService();

  Future<LinesBus> _requestList(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final lines = new LinesBus.fromJsonList(decodedData);
      return lines;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<LineBus> _request(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final line = new LineBus.fromJsonMap(decodedData);
      return line;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<LinesBus> getLines(int page, int limit) async {
    String path = "$_urlRoot/page/lines/$page/$limit";
    return await _requestList(path);
  }

  Future<LineBus> getLine(String id) async {
    String path = "$_urlRoot/lines/$id";
    return await _request(path);
  }
}