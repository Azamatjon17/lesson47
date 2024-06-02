import 'package:flutter/material.dart';
import 'package:lesson47/models/product.dart';

class ProductViewModel {
  final List<Product> _list = [
    Product(id: "1", title: "Iphone 11", price: 250.5, amount: 55),
    Product(id: "2", title: "MacBook M1", price: 1000.0, amount: 10),
    Product(id: "3", title: "AirPods 2", price: 70.0, amount: 100),
  ];

  List<Product> get list => [..._list];

  void addProduct(String newTitle, double newPrice, int newAmount) {
    _list.add(
      Product(
        id: UniqueKey().toString(),
        title: newTitle,
        price: newPrice,
        amount: newAmount,
      ),
    );
  }

  void editProduct(
    String id,
    String newTitle,
    double newPrice,
    int newAmount,
  ) {}

  void deleteProduct(String id) {}
}
