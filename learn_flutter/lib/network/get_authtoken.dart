import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learn_flutter/network/login_request.dart';

Future<String?> getAuthToken() async {
  return await secureStorage.read(key: 'authToken');
}
