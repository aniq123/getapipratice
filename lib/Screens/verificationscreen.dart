// ignore_for_file: prefer_const_constructors

import 'package:apiwworking/screens/otpverification.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class verificationscreen extends StatefulWidget {
  const verificationscreen({super.key});

  @override
  State<verificationscreen> createState() => _verificationscreenState();
}

class _verificationscreenState extends State<verificationscreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              // decoration: BoxDecoration(),
              child: Image.asset(
                'images/opt2.webp',
                scale: 2,
              ),
            ),
            // ignore: prefer_const_constructors
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
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: Text(
                      'Verify',
                      style: TextStyle(color: Colors.white),
                    ))
                //       style: TextStyle(color: Colors.blue)),
                ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => otpverification()));
                      },
                      child: Text(
                        'Edit Phone Number?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.pink),
                      )),
                ],
              ),
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
