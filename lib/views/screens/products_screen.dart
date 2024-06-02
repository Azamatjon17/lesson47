import 'package:flutter/material.dart';
import 'package:lesson47/models/viewmodels/product_view_model.dart';
import 'package:lesson47/views/widgets/add_product_dialog.dart';
import 'package:lesson47/views/widgets/product_items.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductViewModel productViewModel = ProductViewModel();

  void addProduct() async {
    final data = await showDialog(
      context: context,
      builder: (ctx) => const AddProductDialog(),
    );

    if (data != null) {
      productViewModel.addProduct(
        data['title'],
        data['price'],
        data['amount'],
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: addProduct,
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: productViewModel.list.length,
          itemBuilder: (context, index) {
            return ProductItems(
              product: productViewModel.list[index],
              onDelete: () {},
              onEdit: () {},
            );
          }),
    );
  }
}
