class Category {
  final String id;
  final String catagoryName;
  final String itemName;
  final String description;
  final double price;

  Category({
    required this.id,
    required this.catagoryName,
    required this.itemName,
    required this.description,
    required this.price,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'catagoryName': catagoryName,
        'itemName': itemName,
        'description': description,
        'price': price,
      };
}
