import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'dart:developer' as developer;
import '../services/product_service.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class Product {
  String name;
  Icon icon;
  Color color;

  Product({
    required this.name,
    required this.icon,
    required this.color
  });
}

class _AddProductState extends State<AddProduct> {
  final GroupButtonController _controller = GroupButtonController(selectedIndex: 0);
  List<Product> list = [];

  final _barcodeController = TextEditingController();
  String _productName = 'No product found yet';

  final ProductService _productService = ProductService();

  void _getProduct() async {
    try {
      String barcode = _barcodeController.text;
      var product = await _productService.getProduct(barcode);
      setState(() {
        _productName = product?.getProductNameBrandQuantity(OpenFoodFactsLanguage.POLISH, " ") ?? 'no found';
        Product productObject = Product(
          name: _productName,
          icon: const Icon(Icons.table_bar),
          color: const Color(0xFFFCE98B),
        );
        list.add(productObject);
        developer.log(list[list.length - 1].name);
      });
    } catch (e) {
      setState(() {
        _productName = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: _barcodeController,
                  ),
                ),
                const SizedBox(width: 21),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: FilledButton(
                    onPressed: _getProduct,
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
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: product.icon,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
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
                              width: 45,
                              height: 45,
                              child: FilledButton(
                                onPressed: () {},
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFFFDFDFD),
                                  padding: EdgeInsets.zero,
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

