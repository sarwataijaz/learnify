import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Colors/colors.dart';
import 'package:learnify/Screens/Quizzes/show_results.dart';
import '../Games/light_bulb_game.dart';

class ComputerQuiz extends StatefulWidget {
  const ComputerQuiz({super.key});

  @override
  State<ComputerQuiz> createState() => _ComputerQuizState();
}

class _ComputerQuizState extends State<ComputerQuiz> {

  int score = 0;

  Map<int, String> questions = {
    1: 'What is the main part of the computer that makes it work?',
    2: 'Which of these is used to move the cursor on the screen?',
    3: 'Which device is used to type letters and numbers on the computer?',
    4: 'What is the function of the monitor?',
    5: 'What does the Internet allow you to do?'
  };
  int count = 1;

  List<List<String>> options = [
    [
      'Mouse',
      'Keyboard',
      'CPU',
      'Monitor'
    ],
    [
      'Monitor',
      'Mouse',
      'Keyboard',
      'Printer'
    ],
    [
      'Mouse',
      'Keyboard',
      'Speaker',
      'Scanner'
    ],
    [
      'To make sound',
      'To display pictures and text',
      'To store data',
      'To print papers'
    ],
    [
      'Watch movies',
      'Talk to people far away',
      'Search for information',
      'All of the above'
    ],
  ];

  Map<int, String> correct_ans = {
    1: 'CPU',
    2: 'Mouse',
    3: 'Keyboard',
    4: 'To display pictures and text',
    5: 'All of the above'
  };

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 1)); // Wait for 1 second
    current_colorList = List.generate(4, (index) => Colors.white);
    _changeQuestion();
  }

  List<Color> current_colorList = List.generate(4, (index) => Colors.white);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double position = 0.55;


    return Scaffold(
      backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/course1.png'),
                      // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
            Positioned(
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              top: screenHeight * 0.3,
              child: Container(
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double font_size = constraints.maxHeight * 0.2;
                      return Text(
                        'Question # $count',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF5B1CAE),
                          ),
                        ),
                      );
                    }),
                    LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double font_size = constraints.maxHeight * 0.2;
                      return Text(
                        textAlign: TextAlign.center,
                        questions[count] ?? '',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 19,
                              color: Color(0xFF5B1CAE),
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            display_option('A', count - 1, 0, screenWidth, screenHeight, position, 0),
            display_option(
                'B', count - 1, 1, screenWidth, screenHeight, position + 0.1, 1),
            display_option(
                'C', count - 1, 2, screenWidth, screenHeight, position + 0.2, 2),
            display_option(
                'D', count - 1, 3, screenWidth, screenHeight, position + 0.3, 3),
          ],
        ));
  }

  Widget display_option(String option, int row, int col, double screenWidth,
      double screenHeight, double position, int colorIndex) {

    String currentOption = options[row][col];
    Color optionColor = current_colorList[colorIndex];

    return Positioned(
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      top: screenHeight * position,
      child: InkWell(
        onTap: (){
          setState(() {
            current_colorList = List.generate(
              4,
                  (index) => (index == colorIndex && currentOption == correct_ans[count])
                  ? _changeColor()
                  : (index == colorIndex
                  ? Colors.red
                  : Colors.white),
            );
          });
          _loadData();
        },
        child: Container(
          height: screenHeight * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            shape: BoxShape.rectangle,
            color: Colors.white,
            border: Border.all(
                color:  optionColor ,
                width: 1.8,
                style: BorderStyle.solid,
                strokeAlign: 1
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 7, // Blur radius
                offset: Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                EdgeInsets.only(top: 18.5, bottom: 18.5, left: 25),
                child: Container(
                  width: 22,
                  height: 24,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double fontSize = constraints.maxHeight * 0.98;
                      return Text(
                        option,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: fontSize,
                              color: Color(0xFF5B1CAE),
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.57,
                height: 12,
                child:Text(
                  currentOption,
                  // textAlign: (options[row][col].length>13) ? TextAlign.left : TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5B1CAE),
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  //maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _changeColor() {
    score++;
    return Colors.lightGreenAccent;
  }
  void _changeQuestion() {
    setState(() {
      if (count == 5) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ShowResults(score: score,)));
      }
      else
        count++;
    });
  }
}