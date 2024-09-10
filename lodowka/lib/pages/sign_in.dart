import 'package:flutter/material.dart';
import 'log_in.dart';
import 'home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.title});

  final String title;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBD852), // Set the background color to yellow
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 730,
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
                const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xFF1D1808),
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                    prefixIcon: const Icon(Icons.account_circle),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Row(
                      children: [
                        Checkbox(value: true, onChanged: null),
                        Text('Remember Me?', 
                          style: TextStyle(
                          color: Color(0xFF1D1808), 
                          fontSize: 14)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?', 
                        style: TextStyle(
                          color: Color(0xFF41518C),
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> const HomePage())
                        );
                    },
                    style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFBD852),
                    padding: const EdgeInsets.all(14),
                    side: const BorderSide(
                      color: Color(0xFF1D1B20),
                      width: 2
                    )
                    ),
                    child: const Text('Sign In',style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D1B20)),),
                  ),
                ),
                const SizedBox(height: 35),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 2,
                        color: Color(0xFFCAC4D0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15
                      ),
                      child: Text('or'),
                    ),
                    Expanded(
                      child: Divider(
                        height: 2,
                        color: Color(0xFFCAC4D0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                   onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) =>  const LogIn(title: 'Lodowka login page') // Correct class name
                        ),
                      );
                      },
                    style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFAA4B7),
                    padding: const EdgeInsets.all(14),
                    side: const BorderSide(
                      color: Color(0xFF1D1B20),
                      width: 2
                    )
                    ),
                    child: const Text('Log In', 
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D1B20)),),
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
