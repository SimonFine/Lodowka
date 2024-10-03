import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_product.dart';
import 'package:flutter_application_1/pages/fridge.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:custom_linear_progress_indicator/custom_linear_progress_indicator.dart';


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
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 30),
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
  Padding(
    padding: const EdgeInsets.all(30.0),
    child: Center(
      child: ListView(
        children: [
          Container(  // Usunięto Expanded
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFADC4E3),
              border: Border.all(
                width: 2,
                color: const Color(0xFF1D1808)
              ),
              borderRadius: BorderRadius.circular(24)
            ),
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You haven't wasted", 
                    style: TextStyle(
                      fontSize: 20),),
                  Text("food for", style: TextStyle(fontSize: 20)),
                  Text("20 days", 
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ))
                ],
              ),
            ),
          ),
          const SizedBox(height: 42,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Your Fridge", 
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const Fridge()));
                }, 
                label: const Text("View all",
                  style: TextStyle(
                    color: Color(0xFF41518C),
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
                icon: const Icon(Icons.chevron_right, color: Color(0xFF41518C),),
                iconAlignment: IconAlignment.end,
              )
            ],
          ),
          // tu będzie listView.separated
          const SizedBox(height: 27),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFFCE98B),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                width: 2,
                color: const Color(0xFF1D1808)
              )
            ),
            child:  const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text("Mleko UHT 3,2% Bez Laktozy", 
                          style: TextStyle(
                            fontSize: 24
                          ),),
                      ),
                      Icon(Icons.apple, size: 90,)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.hourglass_top),
                      Text("Expires in: 7 Days",
                      style: TextStyle(
                            fontSize: 16
                          ),)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                    child: CustomLinearProgressIndicator(
                      animationDurationSeconds: 1,
                        progressPercent: 0.3,
                        borderColor: Color(0xFF1D1808),
                        borderWidth: 2,
                        colorLinearProgress: Color(0xFF6184C6),
                        borderRadius: 16.0,
                        linearProgressBarBorderRadius: 16,
                        backgroundColor: Color(0xFFFDFDFD),
                        percentTextStyle: TextStyle(
                          fontSize: 0
                        ),
                      ),
                  )
                  
                ],
              ),
            ),
          )
        ],
      ),
    ),
  ),
  const AddProduct(),
  const Profile(),
][currentPageIndex],
    );
  }
}
