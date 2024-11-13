// ignore_for_file: prefer_const_constructors

import 'package:apiwworking/APi/getrateapi.dart';
import 'package:apiwworking/widget/searchConatiner.dart';
//import 'package:apiwworking/widget/searchContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class rateScreen extends StatefulWidget {
  const rateScreen({super.key});

  @override
  State<rateScreen> createState() => _rateScreenState();
}

class _rateScreenState extends State<rateScreen> {
  final getrateapi rateRandom = Get.put(getrateapi());
  void onInit() {
    super.initState();
    rateRandom.rate(); // Fetch rate when the controller initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            //Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.lime,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Exchange Rate',
            style: TextStyle(color: Colors.lime),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.lime),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 330,
                child: searchContainer(
                  Icon: Icon(Icons.search),
                  TextFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search here',
                      border: InputBorder.none,
                    ),
                  ),
                  ThemeDetail: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.lime),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Obx(() {
              if (rateRandom.rate.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: rateRandom.rate.length,
                  itemBuilder: (context, index) {
                    var item = rateRandom.rate[index];
                    return Container(
                      height: 190,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightGreenAccent,
                            Colors.green.shade400
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.currency_exchange,
                                  color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Exchange Rate",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            "From: ${item.fromCurrency}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Text(
                            "To: ${item.convCurrency}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.trending_up, color: Colors.white70),
                              SizedBox(width: 8),
                              Text(
                                "Rate: ${item.rate}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellowAccent,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white70),
                              SizedBox(width: 8),
                              Text(
                                "Date: ${item.date}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
