import 'package:learn_flutter/network/login_out_register/login_request.dart';

Future<String?> getAuthToken() async {
  return await secureStorage.read(key: 'authToken');
}
