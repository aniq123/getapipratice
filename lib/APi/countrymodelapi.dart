import 'dart:convert';

import 'package:apiwworking/model/countrymodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class countrymodelapi extends GetxController {
  var conntrylist = <Countrymodel>[].obs;

  Future<void> CountryData() async {
    final response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      conntrylist.value = jsonData
          .map((item) => Countrymodel.fromJson(item)) // Corrected here
          .toList();
    } else {
      print("Failed to fetch data");
    }
  }
}
