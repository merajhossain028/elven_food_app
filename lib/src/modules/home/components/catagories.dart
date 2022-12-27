import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/catagory_provider.dart';

class Catagories extends ConsumerWidget {
  const Catagories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            catagory.length,
            (index) => CatagoriesCard(
              image: catagory[index]['image'],
              title: catagory[index]['title'],
              press: () {
                ref
                    .read(catagorypd.notifier)
                    .update((state) => catagory[index]['title']);
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
