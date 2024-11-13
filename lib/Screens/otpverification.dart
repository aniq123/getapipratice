// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apiwworking/screens/verificationscreen.dart';
import 'package:flutter/material.dart';

class otpverification extends StatefulWidget {
  const otpverification({super.key});

  @override
  State<otpverification> createState() => _otpverificationState();
}

class _otpverificationState extends State<otpverification> {
  TextEditingController countrycode = TextEditingController();
  TextEditingController phonenumbwe = TextEditingController();

  void initstate() {
    countrycode.text = '92';
    phonenumbwe.text = '3041156872';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              // decoration: BoxDecoration(),
              child: Image.asset(
                'images/otp1.png',
                scale: 2,
              ),
            ),
            Text(
              'Phone Verificatin',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Text(
                'You need to register phone number before \n getting  started ! ',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 270,
              //height: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  SizedBox(
                      width: 50,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(
                            hintText: '  +922', border: InputBorder.none),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '|',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                      width: 150,
                      child: TextField(
                        controller: phonenumbwe,
                        decoration: InputDecoration(
                            hintText: '   3041156872',
                            border: InputBorder.none),
                      )),

                  // TextFormField(
                  //   decoration: InputDecoration(),
                  // ),
                  // TextFormField(
                  //   decoration: InputDecoration(),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verificationscreen()));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: Text(
                      'Send Code',
                      style: TextStyle(color: Colors.white),
                    ))
                //       style: TextStyle(color: Colors.blue)),
                )
            // child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text(
            //       'Send Code',
            //       style: TextStyle(color: Colors.blue),
            //     )))
          ],
        ),
      ),
    );
  }
}
