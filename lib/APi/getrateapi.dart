import 'dart:convert';

import 'package:apiwworking/model/getratemodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class getrateapi extends GetxController {
  var rate = <Getratemodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRate(); // Fetch rate data on initialization
  }

  Future<void> fetchRate() async {
    try {
      final response = await http.get(Uri.parse(
          'https://kekkai-api.redume.su/api/getRate/?from_currency=RUB&conv_currency=USD&date=2024-10-16'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        rate.value = [Getratemodel.fromJson(jsonData)];
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
