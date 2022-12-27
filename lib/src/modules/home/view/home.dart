import 'dart:ui';

import 'package:elven_food_app/src/modules/home/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../added_item/view/add_item.dart';
import '../components/catagories.dart';
import '../components/top_pick_grid.dart';
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE31640),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItems()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE31640),
        title: Center(
          child: Image.asset(
            'assets/images/elvan.png',
            height: 25,
          ),
        ),
      ),
      body: Container(
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
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE31640),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color(0xFFE31640),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    );
  }
}
