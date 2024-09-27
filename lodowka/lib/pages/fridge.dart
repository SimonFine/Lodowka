import 'package:flutter/material.dart';
import 'home_page.dart';

class Fridge extends StatefulWidget {
  const Fridge({super.key});

  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (contex) => HomePage()));
            },
            icon: Icon(Icons.arrow_back, 
              color: Color(0xFF1D1808),
              size: 38,)
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'Your Fridge',
            style: TextStyle(
              color: Color(0xFF1D1808),
              fontSize: 36,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFDFDFD),
        scrolledUnderElevation: 0,
      ),
    );
  }
}