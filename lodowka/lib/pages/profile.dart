import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/log_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBD852),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 550,
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
                left: 30,
                right: 30
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  const Center(
                    child: Text('Alex',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    )),
                  const Center(child: Text('alex.sraniewbanie@gmail.pl',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF41518C),
                      fontWeight: FontWeight.w500
                    ),
                    )),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40
                    ),
                    child: SizedBox(
                      height: 64,
                      child: FilledButton(onPressed: () {}, 
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFFFDFDFD),
                          
                          side: const BorderSide(
                                    color: Color(0xFF1D1B20),
                                    width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.edit, color: Color(0xFF1D1808),),
                                    SizedBox(width: 15),
                                    Text("Edit Profile",
                                      style: TextStyle(
                                        color: Color(0xFF1D1808),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                      ),),
                                  ],
                                ),
                                Icon(Icons.chevron_right, color: Color(0xFF1D1808))
                              ],
                            ),
                        ),)
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16
                    ),
                    child: SizedBox(
                      height: 64,
                      child: FilledButton(onPressed: () {}, 
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFFFDFDFD),
                          
                          side: const BorderSide(
                                    color: Color(0xFF1D1B20),
                                    width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.settings, color: Color(0xFF1D1808),),
                                    SizedBox(width: 15),
                                    Text("Settings",
                                      style: TextStyle(
                                        color: Color(0xFF1D1808),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                      ),),
                                  ],
                                ),
                                Icon(Icons.chevron_right, color: Color(0xFF1D1808))
                              ],
                            ),
                        ),)
                    ),
                    Padding(
                    padding: const EdgeInsets.only(
                      top: 16
                    ),
                    child: SizedBox(
                      height: 64,
                      child: FilledButton(onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (contex) => LogIn(title: 'Lodowka login page')));
                      }, 
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFFFDFDFD),
                          
                          side: const BorderSide(
                                    color: Color(0xFF1D1B20),
                                    width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.logout, color: Color(0xFFDB235E),),
                                    SizedBox(width: 15),
                                    Text("Log Out",
                                      style: TextStyle(
                                        color: Color(0xFFDB235E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                      ),),
                                  ],
                                ),
                                Icon(Icons.chevron_right, color: Color(0xFF1D1808))
                              ],
                            ),
                        ),)
                    ),
                ],
              ),
            ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 190,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Color(0xFFFCCFD8),
                shape: BoxShape.circle,
                border: Border.all(
                color: const Color(0xFF1D1808),
                width: 2.0,
              ),
              ),
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}