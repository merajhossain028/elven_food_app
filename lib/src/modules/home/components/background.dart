import 'package:elven_food_app/src/modules/home/components/glassmorphism.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bgImage.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const GlassBody(),
    );
  }
}
