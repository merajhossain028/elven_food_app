import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBody extends StatelessWidget {
  const GlassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
