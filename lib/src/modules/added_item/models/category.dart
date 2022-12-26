import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String catagoryName;
  final String itemName;
  final String description;
  final double price;
  final String imageUrl;

  Category( {
    required this.id,
    required this.catagoryName,
    required this.itemName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
  factory Category.fromDocument(DocumentSnapshot doc) {
    return Category(
      id: doc['id'],
      catagoryName: doc['catagoryName'],
      itemName: doc['itemName'],
      description: doc['description'],
      price: doc['price'],
      imageUrl: doc['image'],
    );
  }
  Map<String, dynamic> toDocument(){
    return {
      'id': id,
      'catagoryName': catagoryName,
      'itemName': itemName,
      'description': description,
      'price': price,
      'image': imageUrl,
    };
  }
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      catagoryName: map['catagoryName'],
      itemName: map['itemName'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['image'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'catagoryName': catagoryName,
        'itemName': catagoryName,
        'description': description,
        'price': price,
        'image': imageUrl,
      };
      factory Category.formJson(Map<String, dynamic> map) => Category(
      id: map['id'],
      catagoryName: map['catagoryName'],
      itemName: map['itemName'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['image'],
    );
}
