import 'dart:ui';

import 'package:elven_food_app/src/modules/added_item/functions/create_category.dart';
import 'package:elven_food_app/src/modules/added_item/provider/add_item_pd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_text_field.dart';

class AddItems extends ConsumerWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    controller: ref.watch(categoryCntrlrPd),
                    labelText: 'Catagory Name',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: ref.watch(itemCntrlrPd),
                    labelText: 'Item Name',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: ref.watch(descriptionCntrlrPd),
                    labelText: 'Description',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: ref.watch(priceCntrlrPd),
                    labelText: 'Price',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async => await createCatagory(ref),
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
