import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

Future<bool> register(String email, String password, String firstName,
    String lastName, String username) async {
  const String apiUrl = "http://10.0.2.2:5100/api/v1/auth/register";

  try {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'firstname': firstName,
          'lastname': lastName,
          'username': username
        }));
    if (response.statusCode == 201) {
      print("Login successful");
      return true;
    } else {
      print("Login failed");
      return false;
    }
  } catch (e) {
    // Handle network error or exception here
    print("Network error or exception occurred: $e");
    return false;
  }
}
