import 'dart:convert';

import 'package:apiwworking/model/AGIFY.DART';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ageapi extends GetxController {
  var agelist = <Age>[].obs;

  Future<void> agegettter() async {
    final response =
        await http.get(Uri.parse('https://api.agify.io?name=meelad'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      agelist.value = [Age.fromJson(jsonData)];
    } else {
      print("Failed to Fetch DATA");
    }
  }
}
