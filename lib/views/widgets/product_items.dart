import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lesson47/models/product.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ProductItems extends StatelessWidget {
  Product product;
  ProductItems({super.key, required this.product, required this.onDelete, required this.onEdit});
  Function() onEdit;
  Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 222, 222, 222),
              highlightColor: Colors.white,
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "${product.amount}",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
            Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "Tahrirlash",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
                TextButton.icon(
                  onPressed: onEdit,
                  label: const Text(
                    "O'chrish",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
