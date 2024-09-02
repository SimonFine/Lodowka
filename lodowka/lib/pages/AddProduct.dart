import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:group_button/group_button.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {

  final GroupButtonController _controller = GroupButtonController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Homepage()));
            }, 
            icon: Icon(Icons.arrow_back), iconSize: 36),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Add Product', 
            style: TextStyle(
              color: Color(0xFF1D1808),
              fontSize: 36
            ),),
        ),
        backgroundColor: Color(0xFFFDFDFD),
      ),
      backgroundColor: Color(0xFFFDFDFD),
      body: 
      Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),),
                            prefixIcon: Icon(Icons.search),
                            labelText: 'Product name',
                          ),
                        ),
                ),
                SizedBox(width: 21),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: FilledButton(onPressed: () {}, child: Icon(Icons.qr_code, color: Color(0xFF1D1B20),),
                    style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFFFBD852),
                            padding: EdgeInsets.all(14),
                            side: BorderSide(
                              color: Color(0xFF1D1B20),
                              width: 2
                            )
                            ),
                  ),
                ),
                
              ],
            ),
            SizedBox(height: 21),
            GroupButton(
              options: GroupButtonOptions(
                selectedTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF41518C)
                ),
                unselectedTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6184C6)
                ),
                selectedBorderColor: Color(0xFF41518C),
                unselectedBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                elevation: 0,
                selectedColor: Colors.transparent,
                unselectedColor: Colors.transparent,
                spacing: 14,
                
              ), 
              controller: _controller,
              isRadio: true,
              buttons: ["Recent", "Favourite"],
              onSelected: (value,index, isSelected) => print("Button $value at index $index is ${ isSelected ? 'selected' : 'unselected'}"),
           )
            
          ],
        ),
      )
    );
  }
}

