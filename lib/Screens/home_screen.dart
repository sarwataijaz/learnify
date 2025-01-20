import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/colors.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  const HomeScreen({required this.name, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left:30.0, right:30.0, top:30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          'assets/app_bar_logo.png',
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 330,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, ${widget.name}!',
                              style: GoogleFonts.lato(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Learn, Play, and Grow - The Fun Way With Learnify!',
                              style: GoogleFonts.lato(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200),
                                // Cylindrical border
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // Shadow color
                                    spreadRadius: 2,
                                    // How far the shadow spreads
                                    blurRadius: 10,
                                    // How soft the shadow is
                                    offset: Offset(0,
                                        5), // Offset: (x, y) - horizontal and vertical
                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search...',
                                    icon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Color(0xfffB4B4B4),
                                      ),
                                    ),
                                    hintStyle: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xfffB4B4B4),
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              padding: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Color(0xfff002A32),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, ),
                                    child: Image.asset(
                                      'assets/boy.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30.0),
                                        child: Container(
                                          width: 150,
                                          child: Text(
                                            'What would like to learn today?',
                                            style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                            overflow: TextOverflow.visible,
                                            // Optional overflow behavior
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:8.0),
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                          },
                                          label: Text(
                                            "Get Started",
                                            style: GoogleFonts.lato(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.primaryGreen,
                                              foregroundColor: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(45),
                ),
                child:
                    Stack(
                      children: [
                        Image.asset(
                          'assets/decor.png',
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buttonLogos('assets/game.png', 'Games', 50),
                              _buttonLogos('assets/quiz.png', 'Quizzes', 35),
                              _buttonLogos('assets/video.png', 'Videos', 35),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 185,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Explore Modules',
                                      style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'view all',
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      _modules(Color(0xFFFE883A1), 'assets/module1.png', 'Basics of Computer', '8+ Courses'),
                                      SizedBox(width: 30),
                                      _modules(Color(0xFFFA269C8), 'assets/module2.png', 'Ui Ux', '10+ Courses'),
                                      SizedBox(width: 30),
                                      _modules(Color(0xFFF0084E8), 'assets/module3.png', 'Flutter', '10+ Courses'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),

              )
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update current index
          });
        },

        backgroundColor: AppColors.primaryGreen,
        selectedItemColor: AppColors.background,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.white
        ),
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
              icon: Icon(Icons.heart_broken),
              label: 'Wishlist',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
        ]
      ),
    );
  }

  Widget _modules(Color color, String image, String title, String subTitle) {
    return Container(
      width: 250,
      height: 352,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: Image.asset(
                image,
              width: 220,
              height: 220,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 5.0),
              child: Text(
                title,
                style: GoogleFonts.lato(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                subTitle,
                style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.white
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 8.0),
            child: Container(
              width: 210,
              height: 35,
              child: ElevatedButton.icon(
                onPressed: () {
                },
                label: Text(
                  "Start Learning",
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buttonLogos(String imageAsset, String label, double size) {
    return Column(
      children: [
        Container(
          width: 73,
          height: 73,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                // Shadow color
                spreadRadius: 2,
                // How far the shadow spreads
                blurRadius: 10,
                // How soft the shadow is
                offset: Offset(0,
                    5), // Offset: (x, y) - horizontal and vertical
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              imageAsset,
              width: size,
              height: size,
            ),
          ),
        ),
        Text(
            label,
            style: GoogleFonts.lato(
                fontSize: 12,
                color: Colors.white
            )
        )
      ],
    );
  }
}
