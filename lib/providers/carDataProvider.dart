import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/car.dart';

class CarProvider with ChangeNotifier {
  final List<Car> _cars = [];

  List<Car> get cars {
    return [..._cars];
  }

  Future<void> fetchAndSetCars() async {
    Uri url = Uri.parse(
        'https://zylu-e8805-default-rtdb.asia-southeast1.firebasedatabase.app/cars.json');
    try {
      final response = await http.get(url);
      // log(response.body.toString());
      final extractedData = jsonDecode(response.body) as List<dynamic>;
      for (int i = 0; i < extractedData.length; i++) {
        _cars.add(Car.fromJson(extractedData[i]));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
