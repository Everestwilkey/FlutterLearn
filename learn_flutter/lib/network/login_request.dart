import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String apiUrl = "http://10.0.2.2:5100/api/v1/auth/login";
final FlutterSecureStorage secureStorage = FlutterSecureStorage();

// Function to retrieve the authentication token
Future<String?> getAuthToken() async {
  return await secureStorage.read(key: 'authToken');
}

// Function to login user and store token
Future<bool> loginUser(
    String email, String password, BuildContext context) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Store the authentication token securely
    final token = response.headers["token"];
    await secureStorage.write(key: 'authToken', value: token);
    print("token: ${token}");
    return true;
  } else {
    // Handle errors, show a message to the user
    return false;
  }
}
