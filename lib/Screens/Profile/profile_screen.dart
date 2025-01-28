import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Auth/database_service.dart';
import 'package:learnify/Colors/colors.dart';
import 'package:learnify/Screens/Profile/edit_profile_screen.dart';

import '../../Navigations/profile_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final DatabaseService _db = DatabaseService();
  Map<String, dynamic>? _userdata = {};
  bool _isToggled = false;
  String _fullName = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeUser();
  }

  void initializeUser() async {
    if (user != null) {
      try {
        _userdata = await _db.getUser(user!.email ?? '');
        print(_userdata);
        setState(() {
          _fullName = _userdata?['full_name'];
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 325,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: AppColors.primaryGreen,
                    child: Image.asset(
                      'assets/decor_profile.png',
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 168,
                      margin: EdgeInsets.symmetric(horizontal: 23),
                      decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Positioned(
                    top: 65,
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
                    top: 205,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          _fullName,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age: 06',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '|',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 12,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'United States',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            width: 110,
                            height: 30,
                            child: ElevatedButton.icon(
                              onPressed:() {
                                profileNavigatorKey.currentState?.pushNamed('/EditProfile');
                                print('pressed');// nested navigation therefore we need to call it thru global key
                              },
                              label: Text(
                                "Edit Profile",
                                style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                AppColors.primaryGreen,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(13))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Bars(prefix: Icons.language, label: 'Language', suffix: _arrow()),
            SizedBox(height: 10,),
            Bars(prefix: Icons.notifications,
              label: 'Notifications',
              suffix: _toggleButton(),),
            SizedBox(height: 10,),
            Bars(prefix: Icons.menu_book_sharp,
                label: 'Enrolled Courses',
                suffix: _arrow()),
            SizedBox(height: 10,),
            Bars(
                prefix: Icons.lock, label: 'Change Password', suffix: _arrow()),
            SizedBox(height: 10,),
            Bars(prefix: Icons.question_mark_outlined,
                label: 'Help & Support',
                suffix: _arrow()),
            SizedBox(height: 10,),
            Bars(prefix: Icons.logout, label: 'Logout', suffix: _arrow())
          ],
        ),
      );

  }


Widget _toggleButton() {
  return Container(
    width: 40,
    height: 22,
    alignment: (_isToggled) ? Alignment.topRight : Alignment.topLeft,
    decoration: BoxDecoration(
      color: (_isToggled) ? AppColors.primaryGreen : Color(0xfffd7d1d1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: GestureDetector(
      onTap: () {
        setState(() {
          _isToggled = !_isToggled;
        });
      },
      child: CircleAvatar(
        radius: 13,
        backgroundColor: Colors.white,
      ),
    ),
  );
}

Widget _arrow() {
  return Icon(
    Icons.arrow_forward_ios_outlined,
    color: Colors.white,
    size: 15,
  );
}}

class Bars extends StatelessWidget {
  final String label;
  final IconData prefix;
  final Widget suffix;

  const Bars(
      {required this.prefix, required this.label, required this.suffix, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: EdgeInsets.symmetric(horizontal: 23),
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  prefix,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            suffix,
          ],
        ),
      ),
    );
  }
}






