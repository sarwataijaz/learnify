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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      'assets/app_bar_logo.png',
                      //fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
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
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        'What would like to \nlearn today?',
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
                                  ElevatedButton.icon(
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
