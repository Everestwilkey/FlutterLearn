import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/network/login_out_register/register_user.dart';

class RegisterForm extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fnamecontroller = TextEditingController();
  final _lnamecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _usernamecontroller = TextEditingController();

  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _usernamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Username',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Username";
                          }
                          return null; // Validation passed
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          return null; // Validation passed
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Passoword";
                          }
                          return null; // Validation passed
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _fnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your First Name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter First Name";
                          }
                          return null; // Validation passed
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _lnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Last Name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Last Name";
                          }
                          return null; // Validation passed
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Assuming 'register' is an asynchronous function that returns a boolean
                    final success = await register(
                        _emailController.text,
                        _passwordController.text,
                        _fnamecontroller.text,
                        _lnamecontroller.text,
                        _usernamecontroller.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(success
                            ? "Registration successful"
                            : "Registration failed"),
                      ),
                    );

                    if (success) {
                      // Ensure the '/home' route is defined in your app
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                  }
                },
                child: const Text(
                    "Register"), // Changed from "Login" to "Register"
              ),
            ],
          )),
    );
  }
}
