import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage secureStorage = FlutterSecureStorage();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<String> getAuthToken() async {
    return await secureStorage.read(key: 'authToken') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/profile');
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                String authToken = await getAuthToken();
                print('Authtoken: $authToken');
              },
              child: Text('Print Authtoken to Console'),
            ),
          ],
        ),
      ),
    );
  }
}
