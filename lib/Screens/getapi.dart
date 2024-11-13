import 'package:flutter/material.dart';

class getapi extends StatefulWidget {
  const getapi({super.key});

  @override
  State<getapi> createState() => _getapiState();
}

class _getapiState extends State<getapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Expanded(
            child: Text(
          "ShopX",
        ))
      ]),
    );
  }
}
