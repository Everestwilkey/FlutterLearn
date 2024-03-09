import 'package:flutter/material.dart';
import 'package:learn_flutter/class/user.dart';
import 'package:learn_flutter/network/controller_user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final User? user = await getCurrentUser();
      setState(() {
        _user = user;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load user data: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            icon: Icon(Icons.account_circle),
          ),],
      ),
      body: _user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_user!.firstName} ${_user!.lastName}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    _user!.email,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle edit first and last name
                        },
                        child: const Text('Edit Name'),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle edit email
                        },
                        child: const Text('Edit Email'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
