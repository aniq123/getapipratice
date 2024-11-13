import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/liststringmodel.dart';

class stringapi extends GetxController {
  var liststring = <Liststringmodel>[].obs;
  Future<void> fetchList() async {
    final response =
        await http.get(Uri.parse('https://api.apis.guru/v2/providers.json'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      liststring.value = [liststringmodelFromJson(jsonData as String)];
    } else {
      print('Failed to Get Data');
    }
  }
}
