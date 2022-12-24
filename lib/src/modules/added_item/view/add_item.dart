import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/custom_text_field.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final controllerCatagory = TextEditingController();
  final controllerItem = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE31640),
        title: Center(
          child: Image.asset(
            'assets/images/elvan.png',
            height: 25,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomTextField(
                      controller: controllerCatagory,
                      labelText: 'Catagory Name'),
                  const SizedBox(height: 20),
                  CustomTextField(
                      controller: controllerItem, labelText: 'Item Name'),
                  const SizedBox(height: 20),
                  CustomTextField(
                      controller: controllerDescription,
                      labelText: 'Description'),
                  const SizedBox(height: 20),
                  CustomTextField(
                      controller: controllerPrice, labelText: 'Price'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final catagory = Catagory(
                        catagoryName: controllerCatagory.text,
                        itemName: controllerItem.text,
                        description: controllerDescription.text,
                        price: int.parse(controllerPrice.text),
                      );
                      createCatagory(catagory);
                    },
                    child: const Text('Add Catagory Item'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future createCatagory(Catagory catagory) async {
  final docCatagory =
      FirebaseFirestore.instance.collection('catagory').doc();
      catagory.id = docCatagory.id;
  final json = catagory.toJson();
  await docCatagory.set(json);
}

class Catagory {
  final String catagoryName;
  final String itemName;
  final String description;
  final int price;

  Catagory({
    required this.catagoryName,
    required this.itemName,
    required this.description,
    required this.price,
  });
  Map<String, dynamic> toJson() => {
        'catagoryName': catagoryName,
        'itemName': itemName,
        'description': description,
        'price': price,
      };
}
