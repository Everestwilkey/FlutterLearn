import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import secure storage

Future<void> logout(BuildContext context) async {
  // Create an instance of secure storage

  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5100/api/v1/auth/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      // Handle error, e.g., show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to log out')),
      );
    }
  } catch (error) {
    // Handle error, e.g., show an error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred')),
    );
  }
}
