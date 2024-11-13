import 'dart:convert';

import 'package:apiwworking/model/randomusermodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

class getapi extends GetxController {
  var random = <Randomusermodel>[].obs;

  // Fetch data from the API
  Future<void> getrandom() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api?results=10'));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonData = json.decode(response.body);
      //correctly map the json to model
      random.value = [Randomusermodel.fromJson(jsonData)];
    } else {
      print("Failed to fetch");
    }
  }
}
