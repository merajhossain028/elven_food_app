import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridViewPicks extends StatelessWidget {
  var _gridViewPicks = [
    {
      'image': 'assets/images/pizza.png',
      'title': 'Pizza',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/juics.png',
      'title': 'Juice',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _gridViewPicks.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}