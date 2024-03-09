import 'package:flutter/material.dart';

class CoverProfileImage extends StatelessWidget {
  const CoverProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage("assets/logo.png"),
    );
  }
}
