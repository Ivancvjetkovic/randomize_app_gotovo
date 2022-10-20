import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

import 'package:randomize_app/mainScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/signin.png',
                        width: 400,
                        height: 330,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 250),
                    child: Column(
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 19,
                          child: Container(
                            color: Colors.lightBlue,
                            height: 90,
                            width: 180,
                            child: Transform.rotate(
                              angle: math.pi / 19,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 30.0, left: 20.0),
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      width: 300,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      width: 300,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.lightBlue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
