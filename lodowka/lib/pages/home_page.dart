import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_product.dart';
import 'sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HOME PAGE'),
            FilledButton(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const AddProduct()));
                      },
              child: const Text('ADD PRODUCT')),
            FilledButton(onPressed: () {
               Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> const SignIn(title: 'Sign In'))
                  );
            }, 
              child: const Text('GO BACK'))
            ],
        ),
      ),
    );
  }
}