// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

@override
class searchContainer extends StatelessWidget {
  final Icon;
  final TextFormField;
  final ThemeDetail;
  const searchContainer(
      {super.key,
      required this.Icon,
      required this.TextFormField,
      required this.ThemeDetail});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 60,
        decoration: ThemeDetail,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon,
            // ignore: prefer_const_constructors
            SizedBox(
              width: 15,
            ),
            Expanded(child: TextFormField),
            //DecoratedBox(decoration: BoxDecoration(color: Colors.amber))
          ],
        ));
  }
}

class SmallContainer extends StatelessWidget {
  final String alphaTwoCode;
  final String domain;
  final String country;
  final String name;
  final String? stateProvince;
  final String webPages;

  const SmallContainer({
    super.key,
    required this.alphaTwoCode,
    required this.domain,
    required this.country,
    required this.name,
    this.stateProvince,
    required this.webPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.deepOrangeAccent, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Country: $country",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          if (stateProvince != null)
            Text(
              "State/Province: $stateProvince",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          Text(
            "Alpha-2 Code: $alphaTwoCode",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Text(
            "Domain: $domain",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Text(
            "Web Pages: $webPages",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
