// ignore_for_file: prefer_const_constructors

import 'package:apiwworking/APi/fatchfact.dart';
import 'package:apiwworking/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Factscreens extends StatelessWidget {
  Factscreens({super.key});

  final fetchfact facts = Get.put(fetchfact()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    // Call fetchData when the screen is loaded
    facts.fetchData();

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.teal,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.to(() => Api());
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(68.0),
          child: Text("Facts"),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view),
            onPressed: () {
              Get.to(() => Api()); // Navigate to another page
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                // If the list is empty, show a loading spinner
                if (facts.FactList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(facts.FactList.length, (index) {
                    final facct = facts.FactList[index];
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent, // Background color
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            blurRadius: 10, // Shadow blur radius
                            offset: Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fact: ${facct.fact ?? 'N/A'}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Length: ${facct.length ?? 'N/A'}',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
