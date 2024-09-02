import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:group_button/group_button.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class Products {
  String name;
  Icon icon;
  Color color;

  Products({
    required this.name,
    required this.icon,
    required this.color
  });

  static List<Products> GetProducts() {
    List<Products> list = [];
    list.add(Products(
      name: 'Mleko UHT 3,2% Bez Laktozy',
      icon: Icon(Icons.local_drink), // Zmieniona ikona
      color: Color(0xFFFCCFD8),
    ));
    list.add(Products(
      name: 'Jajka Wiejskie',
      icon: Icon(Icons.star), // Zmieniona ikona
      color: Color(0xFFADC4E3),
    ));
    list.add(Products(
      name: 'Chleb Żytni',
      icon: Icon(Icons.g_mobiledata), // Ikona chleba
      color: Color(0xFFADC4E3), // Dodany kolor
    ));
    list.add(Products(
      name: 'Masło',
      icon: Icon(Icons.face), // Ikona masła
      color: Color(0xFFFCCFD8), // Można zmienić na inny kolor, jeśli potrzebujesz
    ));
    list.add(Products(
      name: 'Ser Gouda',
      icon: Icon(Icons.wallet), // Ikona sera
      color: Color(0xFFFCE98B), // Dodany kolor
    ));
    list.add(Products(
      name: 'Jogurt Naturalny',
      icon: Icon(Icons.table_bar), // Ikona jogurtu
      color: Color(0xFFADC4E3), // Dodany kolor
    ));
    list.add(Products(
      name: 'Owoce Tropikalne',
      icon: Icon(Icons.apple), // Ikona owoców
      color: Color(0xFFFCE98B), // Dodany kolor
    ));
    return list;
  }
}

class _AddproductState extends State<Addproduct> {
  final GroupButtonController _controller = GroupButtonController(selectedIndex: 0);
  List<Products> list = [];

  void GetProducts() {
    list = Products.GetProducts();
  }



  @override
  Widget build(BuildContext context) {
    GetProducts();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back),
            iconSize: 36,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Add Product',
            style: TextStyle(
              color: Color(0xFF1D1808),
              fontSize: 36,
            ),
          ),
        ),
        backgroundColor: Color(0xFFFDFDFD),
      ),
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
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
                        borderRadius: BorderRadius.circular(100),
                      ),
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Product name',
                    ),
                  ),
                ),
                SizedBox(width: 21),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: FilledButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.qr_code,
                      color: Color(0xFF1D1B20),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFFBD852),
                      padding: EdgeInsets.all(14),
                      side: BorderSide(
                        color: Color(0xFF1D1B20),
                        width: 2,
                      ),
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
                  color: Color(0xFF41518C),
                ),
                unselectedTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6184C6),
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
              onSelected: (value, index, isSelected) => print(
                "Button $value at index $index is ${isSelected ? 'selected' : 'unselected'}",
              ),
            ),
            SizedBox(height: 17),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final product = list[index];
                  return Container(
                    height: 115,
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xFF1D1808),
                        width: 2
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                        right: 15,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: product.icon,
                          ),
                          SizedBox(
                            width: 192,
                            child: Flexible(
                              child: Text(
                                product.name,
                                style: TextStyle(
                                  color: Color(0xFF1D1808),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: FilledButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF1D1B20),
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Color(0xFFFFDFDFD),
                                  padding: EdgeInsets.all(14),
                                  side: BorderSide(
                                    color: Color(0xFF1D1B20),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 17),
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
