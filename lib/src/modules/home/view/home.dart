import 'package:elven_food_app/src/modules/home/components/background.dart';
import 'package:elven_food_app/src/modules/home/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../components/catagories.dart';
import '../components/recent_order_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFFE31640),
            title: Image.asset(
              'assets/images/elvan.png',
              height: 25,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
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
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE31640),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Color(0xFFE31640),
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.white,
                  color: Colors.white,
                  tabs: const [
                    GButton(icon: Icons.home),
                    GButton(icon: Icons.favorite),
                    GButton(icon: Icons.shopping_cart),
                    GButton(icon: Icons.person),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}