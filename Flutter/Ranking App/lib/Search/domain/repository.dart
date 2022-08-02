import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Search/data/data_model.dart';

final String url = "https://chat-app-fbe6b-default-rtdb.firebaseio.com";

List<User> parseUser(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var users = list.map((e) => User.fromJson(e)).toList();
  return users;
}

List<Record> parseRecord(String responseBody){
  var list = json.decode(json.encode(responseBody)) as List<dynamic>;
  var records = list.map((e) => Record.fromJson(e)).toList();
  return records;
}

Future<List<User>> fetchUsers() async{
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseUser,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}

Future<List<Record>> fetchRecords() async{
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseRecord,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}