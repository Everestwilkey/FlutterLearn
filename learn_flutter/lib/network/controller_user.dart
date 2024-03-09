import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:learn_flutter/class/user.dart';
import 'package:learn_flutter/network/get_authtoken.dart';

Future<User?> getCurrentUser() async {
  // Retrieve authentication token
  final token = await getAuthToken() ?? "";
  final response = await http.get(
    Uri.parse('http://10.0.2.2:5100/api/v1/users/current-user'),
    headers: {
      'token': token,
      'Content-Type': 'application/json; charset=UTF-8',
      // Include token in request headers
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return User.fromJson(data['user']);
  } else {
    throw Exception('Failed to load user data');
  }
}

void fetchUserData() async {
  try {
    final user = await getCurrentUser(); // Call getCurrentUser function
    print('User data: $user');
  } catch (e) {
    print('Error fetching user data: $e');
  }
}
