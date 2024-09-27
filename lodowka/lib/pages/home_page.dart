import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_product.dart';
import 'package:flutter_application_1/pages/profile.dart';

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
      appBar: currentPageIndex == 0
          ? AppBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Hello, Alex',
                  style: TextStyle(
                    color: Color(0xFF1D1808),
                    fontSize: 36,
                  ),
                ),
              ),
              backgroundColor: const Color(0xFFFDFDFD),
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false, 
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CircleAvatar(), //tu trzeba zmienić tak jak S zrobił ale nie spushował 
                )
              ],
            )
          : null, 
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0XFFADC4E3),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_outlined),
            label: 'Add Product',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const Center(
          child: Text('Home Page'),
        ),
        const AddProduct(),
        const Profile(),
      ][currentPageIndex],
    );
  }
}
