import 'package:flutter/material.dart';
import 'package:learn_flutter/class/user.dart';
import 'package:learn_flutter/components/components.dart';
import 'package:learn_flutter/network/network.dart';
import 'package:learn_flutter/network/user_controller/update_user.dart';

import '../../network/user_controller/controller_user.dart';

final _updatemailcontroller = TextEditingController();
final _updatefirstnamecontroller = TextEditingController();
final _updatelastnamecontroller = TextEditingController();
var controllers = [
  _updatefirstnamecontroller,
  _updatelastnamecontroller,
  _updatemailcontroller
];

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
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Info'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0), // Apply symmetrical horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Align children to the center horizontally
              children: <Widget>[
                SizedBox(height: 24), // Add space before the cover image
                Center(child: CoverProfileImage()), // Center the profile image
                SizedBox(
                    height: 24), // Add space between the image and the name
                Text(
                  'Name: ${_user?.firstName} ${_user?.lastName}',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center, // Center align the text
                ),
                SizedBox(height: 8),
                Text(
                  'Email: ${_user?.email}',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center, // Center align the text
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Edit Profile'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min, // To prevent overflow
                          children: [
                            TextField(
                              controller: _updatemailcontroller,
                              decoration: const InputDecoration(
                                  hintText: "Enter Email"),
                            ),
                            TextField(
                              controller: _updatefirstnamecontroller,
                              decoration: const InputDecoration(
                                  hintText: "Enter First Name"),
                            ),
                            TextField(
                              controller: _updatelastnamecontroller,
                              decoration: const InputDecoration(
                                  hintText: "Enter Last Name"),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              print(_user?.email);
                              var userCondition = [
                                _user?.firstName,
                                _user?.lastName,
                                _user?.email
                              ];
                              final success = await updateCurrentUser(
                                _updatefirstnamecontroller.text,
                                _updatelastnamecontroller.text,
                                _updatemailcontroller.text,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(success
                                      ? "Update successful"
                                      : "Update failed"),
                                ),
                              );
                              if (success) {
                                Navigator.of(context).pop(); // Close the dialog
                                await _loadUserData(); // Close the dialog
                              }
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Edit Profile'),
                ),

                // Add more widgets here as needed
              ],
            ),
          ),
        ),
      );
    }
  }
}
