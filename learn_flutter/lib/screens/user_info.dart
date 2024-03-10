import 'package:flutter/material.dart';
import 'package:learn_flutter/class/user.dart';
import 'package:learn_flutter/components/profile_components/cover_image.dart';
import 'package:learn_flutter/network/user_controller/controller_user.dart';

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
              Navigator.of(context)
                  .pop(); // Add pop to return to the previous screen
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Apply symmetrical horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Align children to the center horizontally
              children: <Widget>[
                const SizedBox(height: 24), // Add space before the cover image
                const Center(
                    child: CoverProfileImage()), // Center the profile image
                const SizedBox(
                    height: 24), // Add space between the image and the name
                Text(
                  'Name: ${_user?.firstName} ${_user?.lastName}',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center, // Center align the text
                ),
                const SizedBox(height: 8),
                Text(
                  'Email: ${_user?.email}',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center, // Center align the text
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Implement edit functionality
                  },
                  child: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size.fromHeight(50), // Set a larger button height
                  ),
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
