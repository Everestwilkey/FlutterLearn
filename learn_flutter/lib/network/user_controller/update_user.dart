import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'package:learn_flutter/class/user.dart';

import '../login_out_register/login_request.dart';

const String apiUrl = "http://10.0.2.2:5100/api/v1/users/update-user";

Future<bool> updateCurrentUser(
    String firstName, String lastName, String email) async {
  final token = await getAuthToken() ?? "";
  final response = await http.patch(Uri.parse(apiUrl),
      headers: <String, String>{
        'token': token,
        'Content-Type': "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "firstname": firstName,
        "lastname": lastName,
      }));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
