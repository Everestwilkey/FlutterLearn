import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learn_flutter/components/posts/post_home.dart';
import 'package:learn_flutter/network/post/create_new_post.dart';
import 'package:learn_flutter/network/post/get_all_post.dart';

import '../components/posts/creat_new_post.dart';

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
              Navigator.of(context).pushNamed('/profile');
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // Wrap PostsPage with Expanded
              child: PostsPage(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Addposts(),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
