import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Screens/profile_screen.dart';

import '../Colors/colors.dart';
import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  final String name;

  const BottomNavigation({required this.name, super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;

  late final List<Widget> _screens = [
    HomeScreen(name: widget.name),
    WishList(),
    Notifications(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: AppColors.primaryGreen,
          selectedItemColor: AppColors.background,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.lato(
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          unselectedLabelStyle: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
