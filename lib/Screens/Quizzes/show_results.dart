import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowResults extends StatefulWidget {
  final int score;

  const ShowResults({super.key, required this.score});

  @override
  State<ShowResults> createState() => _ShowResultsState();
}

class _ShowResultsState extends State<ShowResults> with SingleTickerProviderStateMixin {
  int userScore = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      userScore = widget.score;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
              child: Text(
                'Your Score is: ',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 46,
                    color: Color(0xFF5B1CAE),
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 15),
            child: Text(
              '$userScore/5',
              style: GoogleFonts.abrilFatface(
                textStyle: TextStyle(
                  fontSize: 60,
                  color: Colors.pink,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}