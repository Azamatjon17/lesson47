import 'package:flutter/material.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final fromkey = GlobalKey<FormState>();
  String title = "";
  double price = 0.0;
  int amount = 0;

  void sumbit() {
    if (fromkey.currentState!.validate()) {
      fromkey.currentState!.save();
      Navigator.pop(
        context,
        {
          "title": title,
          "price": price,
          "amount": amount,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Mahsulot qo'shish"),
      content: SizedBox(
        height: 270,
        child: Form(
          key: fromkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "mahsulot nomi",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltmos mahsulot nomini kriting";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  title = newValue!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "mahsulot narxi",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltmos mahsulot narxini kriting";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "mahsulot soni",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltmos mahsulot soni kriting";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  amount = int.parse(newValue!);
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Bekor qilish"),
        ),
        FilledButton(
          onPressed: () {
            sumbit();
          },
          child: const Text("Saqlash"),
        ),
      ],
    );
  }
}
