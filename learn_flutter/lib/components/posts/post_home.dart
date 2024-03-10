import 'package:flutter/material.dart';
import 'package:learn_flutter/network/post/get_all_post.dart';
import '../../class/post.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> _postsFuture;
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    _postsFuture = getAllPosts();
    setState(() {});
    print(_postsFuture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _loadPosts(); // Reload posts when user pulls down
        },
        child: FutureBuilder<List<Post>>(
          future: _postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Consider showing the error message here too
              return const Center(child: Text('Failed to load posts'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              // Ensure data is not empty
              final posts = snapshot.data!;
              return ListView(
                children: posts.map((post) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ExpansionTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 30,
                      ),
                      title: Text(post.title),
                      subtitle: Text('\$${post.price.toStringAsFixed(2)}'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(post.content),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            } else {
              return const Center(child: Text('No posts available'));
            }
          },
        ),
      ),
    );
  }
}
