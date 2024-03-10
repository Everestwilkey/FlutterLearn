import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'package:learn_flutter/class/post.dart';
import 'package:learn_flutter/class/user.dart';

import '../login_out_register/login_request.dart';

const String apiUrl = "http://10.0.2.2:5100/api/v1/posts";
Future<List<Post>> getAllPosts() async {
  final token = await getAuthToken() ?? "";
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'token': token, // Common practice to use Bearer token
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // The response is an object with a "posts" key.
    final Map<String, dynamic> parsed = json.decode(response.body);
    // Extract the posts array from the response.
    final List<dynamic> postJsonList = parsed['posts'];
    // Map the JSON list to a list of Post objects.
    List<Post> posts = postJsonList.map((json) => Post.fromJson(json)).toList();
    return posts;
  } else {
    // Improved error handling: log more details for debugging
    print('Failed to load posts: ${response.statusCode}');
    print('Error body: ${response.body}');
    throw Exception('Failed to load posts: ${response.statusCode}');
  }
}
