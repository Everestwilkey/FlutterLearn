import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'package:learn_flutter/class/user.dart';

import '../../components/enums/item_enums.dart';
import '../login_out_register/login_request.dart';

const String apiUrl = "http://10.0.2.2:5100/api/v1/posts";

Future<bool> createPost(
  String title,
  String content,
  double? price,
  ItemTypes itemType,
) async {
  final token = await getAuthToken() ?? "";

  print("${ItemTypes.Pistol.toString().split('.').last}");
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'token': token,
      'Content-Type': "application/json; charset=UTF-8",
    },
    body: jsonEncode(<String, dynamic>{
      // Changed to dynamic for price
      'title': title,
      'content': content,
      'price': price,
      'item':
          ItemTypes.Pistol.toString().split('.').last, // Convert enum to string
    }),
  );
  if (response.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}
