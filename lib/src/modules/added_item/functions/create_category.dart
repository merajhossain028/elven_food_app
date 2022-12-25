import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elven_food_app/src/modules/added_item/functions/upload_image.dart';
import 'package:elven_food_app/src/modules/added_item/models/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/add_item_pd.dart';

Future<void> createCatagory(WidgetRef ref) async {
  final category = Category(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    catagoryName: ref.read(categoryCntrlrPd).text,
    itemName: ref.read(itemCntrlrPd).text,
    description: ref.read(descriptionCntrlrPd).text,
    price: double.tryParse(ref.read(priceCntrlrPd).text) ?? 0.0,
    imageUrl: await uploadImageMobile(ref.read(imagepd))??'',
  );

  await FirebaseFirestore.instance
      .collection('catagory')
      .doc(category.id)
      .set(category.toJson());

  // final catagory = Catagory(
  // final docCatagory = FirebaseFirestore.instance.collection('catagory').doc();
  // catagory.id = docCatagory.id;
  // final json = catagory.toJson();
  // await docCatagory.set(json);
}
