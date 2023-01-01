import 'package:flutter_riverpod/flutter_riverpod.dart';

final catagorypd = StateProvider<String>((ref) => 'all');
final List<Map<String, dynamic>> catagory = [
  {
    'image': 'assets/images/pizza.png',
    'title': 'Pizza',
  },
  {
    'image': 'assets/images/juics.png',
    'title': 'Juice',
  },
  {
    'image': 'assets/images/salad.png',
    'title': 'Salad',
  },
  {
    'image': 'assets/images/salad.png',
    'title': 'Burger',
  },
  {
    'image': 'assets/images/salad.png',
    'title': 'Pasta',
  },
  {
    'image': 'assets/images/salad.png',
    'title': 'Set Meal',
  },
];
final iconColor = StateProvider.family<bool, String>((ref, id) => false);
