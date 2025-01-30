import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Colors/colors.dart';

class LightBulb extends StatefulWidget {
  const LightBulb({super.key});

  @override
  State<LightBulb> createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  final _ansController = TextEditingController();
  final List<String> imagePaths = [
    'assets/bulb_off.png',
    'assets/bulb_on.png',
    'no image',
  ];

  String finalAns = '';

  late Widget image1;
  late Widget image2;
  late Widget image3;
  late Widget image4;

  List<String> currentPath = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      image1 = getRandomImage();
      image2 = getRandomImage();
      image3 = getRandomImage();
      image4 = getRandomImage();
    });
  }

  Widget getRandomImage() {
    int randomIndex = Random().nextInt(imagePaths.length); // Random index
    String imagePath = imagePaths[randomIndex];
    currentPath.add(imagePath);
    print(currentPath);
    if (imagePath == 'no image') {
      return SizedBox.shrink();
    } else {
      return Image.asset(imagePath);
    }
  }

  getResults() {
    print(currentPath);
    for (int i = 0; i < currentPath.length; i++) {
      if (imagePaths[0] == currentPath[i]) {
        finalAns += '0';
      } else if (imagePaths[1] == currentPath[i]) {
        finalAns += '1';
      }
    }

    if(finalAns == _ansController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Correct!!!! 1 point :) ',
            style: TextStyle(fontSize: 16, color: AppColors.background),),
            backgroundColor: AppColors.primaryGreen,)
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Oopss!!!! The correct answer was $finalAns :( ',
            style: TextStyle(fontSize: 16, color: Colors.white),),
            backgroundColor: Colors.red,)
      );
    }
    setState(() {
      finalAns = '';
      currentPath.clear();
      _ansController.clear();

      image1 = getRandomImage();
      image2 = getRandomImage();
      image3 = getRandomImage();
      image4 = getRandomImage();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Light Bulb Game💡',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                margin:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          'Join us on a\nBright Binary Adventure!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(child: image1),
                          Expanded(child: image2),
                          Expanded(child: image3),
                          Expanded(child: image4),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'What is this in Binary?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                        controller: _ansController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.lato(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: 3),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: getResults,
                              label: Text(
                                "Submit",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.background,
                                  foregroundColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  finalAns = '';
                                  currentPath.clear();
                                  _ansController.clear();

                                  image1 = getRandomImage();
                                  image2 = getRandomImage();
                                  image3 = getRandomImage();
                                  image4 = getRandomImage();

                                });
                              },
                              label: Text(
                                "New Bulbs",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.background,
                                  foregroundColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
