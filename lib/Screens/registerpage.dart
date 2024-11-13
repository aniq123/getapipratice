import 'package:apiwworking/APi/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final loginapi apilogin = Get.put(loginapi());

  // TextEditingController NameController = TextEditingController();
  // TextEditingController passwordcontroller = TextEditingController();
  // TextEditingController numbercontroller = TextEditingController();
  // TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Name Field
                  // TextFormField(
                  //   controller: apilogin.emailcontroller,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter Your Name',
                  //     labelText: 'Name',
                  //     labelStyle: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.teal,
                  //     ),
                  //     hintStyle: TextStyle(color: Colors.grey[500]),
                  //     prefixIcon: Icon(Icons.person, color: Colors.teal),
                  //     filled: true,
                  //     fillColor: Colors.grey[100],
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: BorderSide(color: Colors.teal, width: 1.5),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: BorderSide(color: Colors.teal, width: 2),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 15),
                  // Password Field
                  TextFormField(
                    controller: apilogin.passwordcontroller.value,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: Icon(Icons.lock, color: Colors.teal),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.teal, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // Number Field
                  // TextFormField(
                  //   controller: numbercontroller,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter Your Number',
                  //     labelText: 'Number',
                  //     labelStyle: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.teal,
                  //     ),
                  //     hintStyle: TextStyle(color: Colors.grey[500]),
                  //     prefixIcon: Icon(Icons.phone, color: Colors.teal),
                  //     filled: true,
                  //     fillColor: Colors.grey[100],
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: BorderSide(color: Colors.teal, width: 1.5),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: BorderSide(color: Colors.teal, width: 2),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 15),
                  // Email Field
                  TextFormField(
                    controller: apilogin.emailcontroller.value,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: Icon(Icons.email, color: Colors.teal),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.teal, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        apilogin.loginApi();
                        ;
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
