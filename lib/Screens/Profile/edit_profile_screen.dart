import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Colors/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.primaryGreen,
                    child: Image.asset(
                      'assets/decor_profile.png',
                    ),
                  ),
                  Positioned(
                    top: 165,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 580,
                      margin: EdgeInsets.symmetric(horizontal: 23),
                      decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Positioned(
                    top: 95,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundColor: AppColors.background,
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            child: Image.asset('assets/profile_pic.png'));
                      }),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    left: 0,
                    right: 280,
                    child: IconButton(
                        onPressed:() => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 18,)
                    )
                  ),
                  Positioned(
                    top: 250,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          InputFields(label: 'Email', hintLabel: 'yourname@email.com',),
                          InputFields(label: 'Name', hintLabel: 'Your name',),
                          InputFields(label: 'Phone Number', hintLabel: '00000000000',),
                          InputFields(label: 'Country', hintLabel: 'e.g. United States',),
                          InputFields(label: 'Date of Birth', hintLabel: '1/1/2019',),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class InputFields extends StatelessWidget {

  final String label;
  final String hintLabel;

  const InputFields({super.key, required this.label, required this.hintLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.white,
                ),
          ),
        ),
        Container(
          height: 44,
          margin: EdgeInsets.only(top: 5, bottom: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              // controller: _passwordController,
              decoration: InputDecoration(
                hintText: hintLabel,
                hintStyle: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xfffD4D4D4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

