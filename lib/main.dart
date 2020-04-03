import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _listdata = await getJson();
  for(int i = 0; i < _listdata.length; i++){

    print("Name: ${_listdata[i]['name']}");
    print("Street: ${_listdata[i]['address']['street']}");
    print("Latitude: ${_listdata[i]['address']['geo']['lat']}");
    print("Phone number: ${_listdata[i]['phone']}");
    print("Company name: ${_listdata[i]['company']['name']}");

  }
    runApp(new MaterialApp(
      title: "JSON Parse",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("JSON Parse"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: new Center(
          child: new Text("Parsing..."),
        ),
      ),
    ));

}

Future<List> getJson() async {
  http.Response theResponse = await http.get("https://jsonplaceholder.typicode.com/users");
  return json.decode(theResponse.body);
}