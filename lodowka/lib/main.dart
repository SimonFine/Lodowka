import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/LogIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lodowka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Uncomment this in further development to use material colors
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const LogIn(title: 'Lodowka login page'),
    );
  }
}
