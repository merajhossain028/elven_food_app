import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/catagories.dart';
import '../components/custom_text.dart';
import '../components/recent_order_list.dart';
import '../components/top_pick_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bgImage.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      CustomHeadingText(
                        title: 'Categories',
                        fontSize: 28,
                      ),
                      const Spacer(),
                      CustomSubText(subtitle: 'View all'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Catagories(),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      CustomHeadingText(
                        title: 'Recently Ordered',
                        fontSize: 16,
                      ),
                      const Spacer(),
                      CustomSubText(subtitle: 'View all'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const RecentOrder(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CustomHeadingText(
                        title: 'Top picks',
                        fontSize: 28,
                      ),
                    ],
                  ),
                   const TopPicksGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
