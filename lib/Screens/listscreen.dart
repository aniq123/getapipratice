// ignore_for_file: prefer_const_constructors

import 'package:apiwworking/widget/searchConatiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/stringapi.dart';

class listscreen extends StatefulWidget {
  const listscreen({super.key});

  @override
  State<listscreen> createState() => _listscreenState();
}

class _listscreenState extends State<listscreen> {
  final stringapi stringList = Get.put(stringapi());

  @override
  void initState() {
    super.initState();
    stringList.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.list),
        ),
        title: Text('List of Websites'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.no_accounts),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 330,
                child: searchContainer(
                  Icon: Icon(Icons.search),
                  TextFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search Here',
                      border: InputBorder.none,
                    ),
                  ),
                  ThemeDetail: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              if (stringList.liststring.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container();
                // return ListView.builder(
                //   itemCount: stringList.liststring.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(stringList.liststring.first.data![index]),
                //     );
                //   },
                //   physics: const BouncingScrollPhysics(),
                // );
              }
            }),
          ),
        ],
      ),
    );
  }
}
