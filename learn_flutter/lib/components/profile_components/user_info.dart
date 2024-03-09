import 'package:flutter/material.dart';
import 'package:learn_flutter/class/user.dart';
import 'package:learn_flutter/components/profile_components/cover_image.dart';
import 'package:learn_flutter/network/controller_user.dart';

class ProfilePageinfo extends StatefulWidget {
  const ProfilePageinfo({super.key});

  @override
  State<ProfilePageinfo> createState() => _ProfilePageinfoState();
}

class _ProfilePageinfoState extends State<ProfilePageinfo> {
  User? _user;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final User? userData = await getCurrentUser();
      if (mounted) {
        setState(() {
          _user = userData;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load user data: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Info')),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CoverProfileImage(),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Name: ${_user?.firstName} ${_user?.lastName}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Email: ${_user?.email}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ElevatedButton(onPressed: () {}, child: Text("Edit"))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
