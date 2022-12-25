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
  Map<String, dynamic> toJson() => {
        'id': id,
        'catagoryName': catagoryName,
        'itemName': itemName,
        'description': description,
        'price': price,
        'image': imageUrl,
      };
}
