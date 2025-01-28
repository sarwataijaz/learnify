import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'course_player.dart';

class CourseDetails extends StatefulWidget {

   final String imageAsset;
   final String title;
   final Color primaryColor;
   final Color secondaryColor;

   const CourseDetails({super.key, required this.imageAsset, required this.title, required this.primaryColor, required this.secondaryColor});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
 // const CourseDetails({super.key,});

  final List<String> _uiux = [
    'Introduction to the Class',
    'App for UI design',
    'Install Figma',
    'Typography',
    'Style Guide in Figma',
    "Foundations of Effective UI Design",
    "Crafting Modern App Interfaces"
  ];

  final List<String> _computers = [
    'Introduction to Computers',
    'Understanding Hardware',
    'Navigating the Operating System',
    'Exploring File Management',
    'Input and Output Devices',
    "Operating Systems Overview",
    "Role of Software in Computing"
  ];

  final List<String> _flutter = [
    'What is Flutter?',
    'Building Your First Flutter App',
    'The Magic of Widgets',
    'Creating Rows and Columns',
    'Adding Images and Icons',
    "Customizing Widgets",
    "Scrolling and Lists"
  ];

  final List<String> sectionUiUx = [
    'Section 1 - Introductions',
    'Section 2 - Basic UI/UX',
  ];
  final List<String> sectionComputers = [
    'Section 1: Getting Started with Computers',
    'Section 2: Exploring Computer Systems and Software'
  ];

  final List<String> sectionFlutter = [
    'Section 1: Introduction to Flutter',
    'Section 2: Flutter Widgets and Layouts'
  ];

  late List<String> currentSection;
  late List<String> currentCourse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.title == 'Basics of Computer') {
      currentCourse = _computers;
      currentSection = sectionComputers;
    }
    else if(widget.title == 'Basic UI/UX designing') {
      currentCourse = _uiux;
      currentSection = sectionUiUx;
    }
    else if(widget.title == 'Flutter') {
      currentCourse = _flutter;
      currentSection = sectionFlutter;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
               widget.imageAsset,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Instructor: Micah Rechard',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _modules(context, currentSection[0], 0, 2),
                  SizedBox(
                    height: 20,
                  ),
                  _modules(context, currentSection[1], 2, currentCourse.length - 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _modules(BuildContext context, String label, int startIndex, int endIndex) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: endIndex,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: widget.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        currentCourse[startIndex++],
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                        child: Icon(Icons.play_circle_outline, color: Colors.white)),
                  ],
                ),
              ),
              hoverColor: Colors.white70,
              onTap: () {
                  switch(widget.title) {
                    case 'Basics of Computer':
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CoursePlayer(courseTitle: 'Basics of Computer', courseAsset: 'assets/videos/course_1.mp4',)));
                        break;
                      }
                    case 'Basic UI/UX designing':
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CoursePlayer(courseTitle: 'Ui Ux', courseAsset: 'assets/videos/course_2.mp4')));
                        break;
                      }
                    case 'Flutter':
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CoursePlayer(courseTitle: 'Flutter', courseAsset: 'assets/videos/course_3.mp4',)));
                        break;
                      }
                  }
              },
            );
          },
        ),
      ],
    );
  }
}


