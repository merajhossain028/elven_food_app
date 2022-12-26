import 'dart:ui';

import 'package:elven_food_app/src/configs/size_config.dart';
import 'package:elven_food_app/src/modules/added_item/functions/create_category.dart';
import 'package:elven_food_app/src/modules/added_item/provider/add_item_pd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/take_image/modal_bottom_sheet.dart';
import '../components/custom_text_field.dart';

class AddItems extends ConsumerWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final image = ref.watch(imagepd);
    //String imageUrl = '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        height: size.height,
        width: size.width,
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
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(0.8),
            child: SingleChildScrollView(
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
                    image == null
                        ? InkWell(
                            onTap: () async {
                              await modalBottomSheetMenu(context).then((pk) =>
                                  ref.read(imagepd.notifier).update((_) => pk));
                            },
                            child: Container(
                              height: ScreenSize.height * 0.25,
                              width: ScreenSize.width * 0.7,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                size: 50,
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            height: ScreenSize.height * 0.25,
                            width: ScreenSize.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.file(image),
                          ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await createCatagory(ref);

                      
                      },
                      child: const Text('Add Catagory Item'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
