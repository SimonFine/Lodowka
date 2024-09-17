import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_product.dart';
import 'sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0XFFADC4E3),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        destinations: const<Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_outlined),
            label: 'Add Product',
          ),
        ],
      ),
      body: <Widget>[
      Center(
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
      const AddProduct(),
      //Tutaj dodawac instancje kolejnych widzetow do ktorych bedziemy nawigowac benc clclcl
      ][currentPageIndex]
    );
  }
}