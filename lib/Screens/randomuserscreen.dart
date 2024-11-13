// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apiwworking/APi/randomuserapi.dart';
import 'package:apiwworking/widget/searchConatiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  final getapi userRandom = Get.put(getapi());

  @override
  void initState() {
    super.initState();
    userRandom.getrandom(); // Fetches data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.list_rounded,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            "Random User List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      border: Border.all(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() {
              if (userRandom.random.isEmpty) {
                // Display a loading indicator if the list is empty
                return Center(child: CircularProgressIndicator());
              } else {
                // Display the list when data is available
                // return ListView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: userRandom.random[0].results.length,
                //     itemBuilder: (context, index) {
                //       var item = userRandom.random[0].results[index];
                //       return ListTile(
                //         title: Text("${item.name.first} ${item.name.last}"),
                //         subtitle: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "Email: ${item.email}",
                //               style: TextStyle(color: Colors.green),
                //             ),
                //             Text("Phone: ${item.phone}"),
                //             Text(
                //                 "Location: ${item.location.city}, ${item.location.country}"),
                //             // Text(
                //             //     "DOB: ${item.dob.date.split('T')[0]}"), // Showing only the date part
                //           ],
                //         ),
                //         leading: CircleAvatar(
                //           backgroundImage: NetworkImage(item.picture.thumbnail),
                //         ),
                //         trailing: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "Age: ${item.dob.age}",
                //               style: TextStyle(color: Colors.deepPurple),
                //             ), // Shows the age of the user
                //             Text(
                //               "Gender: ${item.gender}",
                //               style: TextStyle(color: Colors.greenAccent),
                //             ),
                //           ],
                //         ),
                //         isThreeLine: true, // Allows more lines in subtitle
                //       );
                //     });
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userRandom.random[0].results.length,
                  itemBuilder: (context, index) {
                    var item = userRandom.random[0].results[index];
                    return Container(
                      height:
                          190, // Increased height for better content spacing
                      margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16), // Margin between the items
                      padding:
                          EdgeInsets.all(16), // Padding inside the container
                      decoration: BoxDecoration(
                        color: Colors.white, // White background for the card
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.1), // Light shadow for depth
                            blurRadius: 10, // Shadow blur effect
                            offset: Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets
                            .zero, // Remove default padding from ListTile
                        title: Text(
                          "${item.name.first} ${item.name.last}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // Larger font size for name
                            color: Colors
                                .indigoAccent, // Custom color for the name
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 8), // Adding space between elements
                            Text(
                              "Email: ${item.email}",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 10),
                            ),
                            Text(
                              "Phone: ${item.phone}",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 10),
                            ),
                            Text(
                              "Location: ${item.location.city}, ${item.location.country}",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 10),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 25, // Larger avatar size
                          backgroundImage: NetworkImage(item.picture.thumbnail),
                          backgroundColor: Colors.grey[
                              300], // Background color in case image is loading
                          child: item.picture.thumbnail == null
                              ? Icon(Icons.person,
                                  size: 30,
                                  color: Colors.white) // Fallback icon
                              : null,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age: ${item.dob.age}",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight:
                                    FontWeight.w600, // Bold text for age
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                                height: 4), // Spacing between age and gender
                            Text(
                              "Gender: ${item.gender}",
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 14,
                                fontStyle:
                                    FontStyle.italic, // Italics for gender
                              ),
                            ),
                          ],
                        ),
                        isThreeLine: true, // Allows multiple lines in subtitle
                      ),
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
