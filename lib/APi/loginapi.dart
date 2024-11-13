import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class loginapi extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  void loginApi() async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://elohimtechnology.com/wakhlamarketplace/public/api/login'),
        body: {
          "password": passwordcontroller.value.text,
          "email": emailcontroller
              .value.text, // Access the controller's text directly
        },
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
            "Login Successful",
            data['message'] ??
                'Welcome!'); // Use the correct key if there's a 'message'
      } else {
        Get.snackbar("Error", data['error'] ?? 'Something went wrong.');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
}
