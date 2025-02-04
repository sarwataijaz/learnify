import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Screens/Courses/course_details.dart';
import 'package:learnify/Screens/Profile/profile_screen.dart';
import 'package:learnify/Screens/Courses/course_player.dart';
import 'package:learnify/Screens/Quizzes/computer_quiz.dart';

import '../Colors/colors.dart';
import 'Games/light_bulb_game.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({required this.name, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
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
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double containerWidth = constraints.maxWidth;
                                double containerHeight = constraints.maxHeight;
                                return Container(
                                  width: containerWidth,
                                  height: containerHeight + 20,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                        ),
                                        child: Image.asset(
                                          'assets/boy.png',
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0),
                                            child: Container(
                                              width: MediaQuery
                                                  .sizeOf(context)
                                                  .width * 0.30,
                                              child: Expanded(
                                                child: Text(
                                                  'What would you like to learn today?',
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
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: 100,
                                              height: 34,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      AppColors.primaryGreen,
                                                      minimumSize: Size(double.infinity, 60),
                                                      foregroundColor: Colors
                                                          .white),
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                        "Get Started",
                                                      style: GoogleFonts.lato(
                                                            fontSize: 9.9,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight
                                                                .w500),
                                                      ),
                                                  ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
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
              child: Stack(
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
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LightBulb())),
                            child: _buttonLogos('assets/game.png', 'Games', 50),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ComputerQuiz())),
                            child: _buttonLogos('assets/quiz.png', 'Quizzes', 35)
                        ),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _modules(
                                    Color(0xFFFE883A1),
                                    'assets/module1.png',
                                    'Basics of Computer',
                                    '8+ Courses'),
                                SizedBox(width: 30),
                                _modules(
                                    Color(0xFFFA269C8),
                                    'assets/module2.png',
                                    'Ui Ux',
                                    '10+ Courses'),
                                SizedBox(width: 30),
                                _modules(
                                    Color(0xFFF0084E8),
                                    'assets/module3.png',
                                    'Flutter',
                                    '10+ Courses'),
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
                    color: Colors.white),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                subTitle,
                style: GoogleFonts.lato(fontSize: 14, color: Colors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 8.0),
            child: Container(
              width: 210,
              height: 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  switch(title) {
                    case 'Basics of Computer':
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CourseDetails(imageAsset:  'assets/course2.png', title: 'Basics of Computer', primaryColor: Color(0xfffA8506A), secondaryColor: Color(0xfffCE748F),)));
                        break;
                      }
                    case 'Ui Ux':
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CourseDetails(imageAsset: 'assets/course1.png', title: 'Basic UI/UX designing', primaryColor: Color(0xfff5D2872), secondaryColor: Color(0xfffA269C8),)));
                        break;
                      }
                    case 'Flutter':
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CourseDetails(imageAsset: 'assets/course3.png', title: 'Flutter', primaryColor: Color(0xfff0084E8), secondaryColor: Color(0xfff307CBB),)));
                        break;
                      }
                  }
                },
                label: Text(
                  "Start Learning",
                  style: GoogleFonts.lato(
                      fontSize: 12, fontWeight: FontWeight.w500),
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
                offset:
                    Offset(0, 5), // Offset: (x, y) - horizontal and vertical
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
        Text(label, style: GoogleFonts.lato(fontSize: 12, color: Colors.white))
      ],
    );
  }
}

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
      body: Center(
          child: Text("Wishlist Screen", style: TextStyle(fontSize: 24))),
    );
  }
}

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification")),
      body: Center(
          child: Text("Notification Screen", style: TextStyle(fontSize: 24))),
    );
  }
}
