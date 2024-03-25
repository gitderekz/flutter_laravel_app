import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.response}) : super(key: key);

  final http.Response response;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var jsonString = widget.response.body;
    // Parse the JSON string
    Map<String, dynamic> data = jsonDecode(jsonString);
    // Access the 'firstname' field
    String name = "${data['client']['firstname']} ${data['client']['middlename']} ${data['client']['lastname']}";
    String email = data['client']['firstname'];

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius:BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name: ${name}\nEmail: ${email}\nStatus: ${widget.response.statusCode}"),
          )
        ),
      ),
    );
  }
}
