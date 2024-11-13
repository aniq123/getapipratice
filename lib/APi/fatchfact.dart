import 'dart:convert';

import 'package:apiwworking/model/fact.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class fetchfact extends GetxController {
  var FactList = <Fact>[].obs;

  // Fetch data from the API
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonData = json.decode(response.body);

      // Correctly map the JSON to Fact model
      FactList.value = [
        Fact.fromJson(jsonData) // Wrap in a list if it's a single object
      ];
    } else {
      print("Failed to fetch data");
    }
  }
}
