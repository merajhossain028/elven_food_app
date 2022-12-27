import 'package:flutter/material.dart';

import '../../added_item/models/category.dart';
import '../components/description.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category.catagoryName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFE31640),
        elevation: 0,
      ),
      body: Description(
        category: category,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Add to cart'),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFFE31640),
      ),
    );
  }
}
