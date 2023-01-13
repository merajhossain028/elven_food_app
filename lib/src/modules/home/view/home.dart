import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../added_item/view/add_item.dart';
import '../../profile/view/profile.dart';
import '../screens/favourite_screen.dart';
import '../screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final PageController controller = PageController(initialPage: 0);
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
      body: PageView.builder(
          itemCount: 4,
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return index == 0
                ? const HomeScreen()
                : index == 1
                    ? const FavouriteScreen()
                    : index == 2
                        ? Text('$index')
                        : const ProfileScreen();
          }),
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
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
