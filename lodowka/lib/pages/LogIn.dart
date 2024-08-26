// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key, required this.title});

  final String title;

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBD852), // Set the background color to yellow
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 650,
          decoration: BoxDecoration(
            color: const Color(0xFFFDFDFD),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            border: Border.all(
              color: const Color(0xFF1D1808),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 90,
              left: 30,
              right: 30,
              bottom: 33,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'LOG IN',
                  style: TextStyle(
                    color: Color(0xFF1D1808),
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: null),
                        Text('Remember Me?'),
                      ],
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: null,
                    child: Text('Log In'),//buttony są nieaktywne więc na razie dodawanie kolorów się jakoś sra
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 2,
                        color: Color(0xFFCAC4D0),
                      ),
                    ),
                    Text('or'),
                    Expanded(
                      child: Divider(
                        height: 2,
                        color: Color(0xFFCAC4D0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: null,
                    child: Text('Sign In'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
