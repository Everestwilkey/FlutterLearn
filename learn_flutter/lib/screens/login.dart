import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/components/loginform.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: AssetImage("assets/logo.png"),
                        width: 200,
                        height: 200,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[LoginForm()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                      child: Text('Register'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
