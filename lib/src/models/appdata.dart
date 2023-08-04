import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    var url = Uri.https('api.b7web.com.br', '/flutter1wb');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body);
      print(jsonResponse);
      setData(jsonResponse);
      return true;
    } else {
      return false;
    }
  }
}
