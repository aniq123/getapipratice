import 'package:apiwworking/APi/countrymodelapi.dart';
import 'package:apiwworking/model/countrymodel.dart'; // Import Countrymodel class
import 'package:apiwworking/widget/searchConatiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Countryscreen extends StatefulWidget {
  @override
  _CountryscreenState createState() => _CountryscreenState();
}

class _CountryscreenState extends State<Countryscreen> {
  final countrymodelapi countryController = Get.put(countrymodelapi());

  @override
  void initState() {
    super.initState();
    // Call the API function to fetch the data
    countryController.CountryData(); // Corrected function call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.list),
        ),
        title: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Text(
            'University List',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.teal),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.no_accounts)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              searchContainer(
                Icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                TextFormField: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
                ThemeDetail: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: Colors.deepOrangeAccent, width: 2)),
              ),
              SizedBox(height: 10),
              // Use Obx to observe changes in the country list
              Obx(() {
                // Checking if the list is empty, show loading or error
                if (countryController.conntrylist.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countryController.conntrylist.length,
                  itemBuilder: (context, index) {
                    var item = countryController.conntrylist[index];
                    return SmallContainer(
                      alphaTwoCode:
                          alphaTwoCodeValues.reverse[item.alphaTwoCode] ??
                              'N/A',
                      domain: item.domains.join(', ') ?? 'N/A', // Corrected
                      country: item.country.toString() ?? 'N/A', // Corrected
                      name: item.name ?? 'N/A',
                      stateProvince: item.stateProvince ?? 'N/A',
                      webPages: item.webPages.join(', ') ?? 'N/A', // Corrected
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
