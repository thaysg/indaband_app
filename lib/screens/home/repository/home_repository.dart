import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:indaband_app/models/home_model.dart';

class HomeRepository {
  Future<List<HomeModel>> getHome() async {
    final response = await rootBundle.loadString("assets/database/data.json");
    final list = jsonDecode(response) as List;
    final home = list.map((e) => HomeModel.fromMap(e)).toList();
    return home;
  }
}
