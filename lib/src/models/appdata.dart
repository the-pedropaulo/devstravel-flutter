import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = ['Paris'];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  bool hasFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool addFavorite(cityName) {
    if (hasFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    } else {
      favorites.add(cityName);
      return true;
    }
  }

  List favoritesList() {
    List result = [];

    for (var favorite in favorites) {
      List foundCities = searchCity(favorite);
      if (foundCities.isNotEmpty) {
        result.add(foundCities[0]);
      }
    }

    return result;
  }

  List searchCity(text) {
    List result = [];

    text = text.toString().trim().toLowerCase();

    if (text == '') {
      return result;
    }

    for (var continents in data) {
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toString().toLowerCase().contains(text)) {
            result.add(city);
          }
        }
      }
    }

    return result;
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
