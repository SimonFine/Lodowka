import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:group_button/group_button.dart';
import 'dart:developer' as developer;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
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

  static List<Products> getProducts() {
    List<Products> list = [];
    list.add(Products(
      name: 'Mleko UHT 3,2% Bez Laktozy',
      icon: const Icon(Icons.local_drink), // Zmieniona ikona
      color: const Color(0xFFFCCFD8),
    ));
    list.add(Products(
      name: 'Jajka Wiejskie',
      icon: const Icon(Icons.star), // Zmieniona ikona
      color: const Color(0xFFADC4E3),
    ));
    list.add(Products(
      name: 'Chleb Żytni',
      icon: const Icon(Icons.g_mobiledata), // Ikona chleba
      color: const Color(0xFFADC4E3), // Dodany kolor
    ));
    list.add(Products(
      name: 'Masło',
      icon: const Icon(Icons.face), // Ikona masła
      color: const Color(0xFFFCCFD8), // Można zmienić na inny kolor, jeśli potrzebujesz
    ));
    list.add(Products(
      name: 'Ser Gouda',
      icon: const Icon(Icons.wallet), // Ikona sera
      color: const Color(0xFFFCE98B), // Dodany kolor
    ));
    list.add(Products(
      name: 'Jogurt Naturalny',
      icon: const Icon(Icons.table_bar), // Ikona jogurtu
      color: const Color(0xFFADC4E3), // Dodany kolor
    ));
    list.add(Products(
      name: 'Owoce Tropikalne',
      icon: const Icon(Icons.apple), // Ikona owoców
      color: const Color(0xFFFCE98B), // Dodany kolor
    ));
    return list;
  }
}

class _AddProductState extends State<AddProduct> {
  final GroupButtonController _controller = GroupButtonController(selectedIndex: 0);
  List<Products> list = [];

  void getProductsFromList() {
    list = Products.getProducts();
  }



  @override
  Widget build(BuildContext context) {
    getProductsFromList();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Add Product',
            style: TextStyle(
              color: Color(0xFF1D1808),
              fontSize: 36,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFDFDFD),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, // Usuwa automatyczną strzałkę wstecz
      ),
      backgroundColor: const Color(0xFFFDFDFD),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      labelText: 'Product name',
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFBD852),
                      padding: const EdgeInsets.all(14),
                      side: const BorderSide(
                        color: Color(0xFF1D1B20),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.qr_code,
                      color: Color(0xFF1D1B20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 21),
            GroupButton(
              options: GroupButtonOptions(
                selectedTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF41518C),
                ),
                unselectedTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6184C6),
                ),
                selectedBorderColor: const Color(0xFF41518C),
                unselectedBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                elevation: 0,
                selectedColor: Colors.transparent,
                unselectedColor: Colors.transparent,
                spacing: 14,
              ),
              controller: _controller,
              isRadio: true,
              buttons: const ["Recent", "Favourite"],
              onSelected: (value, index, isSelected) => developer.log(
                "Button $value at index $index is ${isSelected ? 'selected' : 'unselected'}",
              ),
            ),
            const SizedBox(height: 17),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 15),
                itemBuilder: (context, index) {
                  final product = list[index];
                  return Container(
                    height: 115,
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFF1D1808),
                        width: 2
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),  //rowny padding w calym kontenerze produktu
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: product.icon,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),  //aby oddzielic tekst od przycisku dodaj
                              child: Text(
                                product.name,
                                style: const TextStyle(
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
                              width: 45,  //45 chyba jest blizej figmy
                              height: 45,
                              child: FilledButton(
                                onPressed: () {},
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFFFDFDFD),
                                  padding: EdgeInsets.zero, //aby ikonka byla wycentrowana nawet jesli zmieniamy wymiary SizedBox
                                  side: const BorderSide(
                                    color: Color(0xFF1D1B20),
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xFF1D1B20),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 17),
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
