import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/home_api.dart';

class Catagories extends StatelessWidget {
  const Catagories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> catagories = [
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
        'title': 'Salad',
      },
      {
        'image': 'assets/images/salad.png',
        'title': 'Salad',
      },
      {
        'image': 'assets/images/salad.png',
        'title': 'Salad',
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            catagories.length,
            (index) => CatagoriesCard(
              image: catagories[index]['image'],
              title: catagories[index]['title'],
              press: () {
                if (index == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Demo()));
                  const Color(0xFFE31640);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class CatagoriesCard extends StatelessWidget {
  const CatagoriesCard(
      {super.key,
      required this.image,
      required this.title,
      required this.press});
  final String image, title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 102,
        height: 123,
        child: Card(
          color: const Color.fromRGBO(104, 104, 104, 0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
