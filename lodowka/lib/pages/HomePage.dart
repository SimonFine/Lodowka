import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/AddProduct.dart';
import 'SignIn.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME PAGE'),
            FilledButton(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> Addproduct()));
                      },
              child: Text('ADD PRODUCT')),
            FilledButton(onPressed: () {
               Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> Signin(title: 'Sign In'))
                  );
            }, 
              child: Text('GO BACK'))
            ],
        ),
      ),
    );
  }
}