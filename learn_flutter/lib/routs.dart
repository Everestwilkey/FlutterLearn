import 'package:learn_flutter/screens/profile.dart';
import 'package:learn_flutter/screens/screens.dart';

var appRoutes = {
  '/': (context) => const Login(),
  '/home': (context) => const HomePage(),
  '/register': (context) => const Register(),
  '/profile': (context) => const ProfilePage()
};
