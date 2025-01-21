import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Auth/database_service.dart';
import 'package:learnify/Colors/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final DatabaseService _db = DatabaseService();
  Map<String, dynamic>? _userdata = {};

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    if (user != null) {
      String email = user!.email ?? '';
      _userdata = await _db.getUser(email);
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
                  width: MediaQuery.of(context).size.width,
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
                    width: MediaQuery.of(context).size.width,
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
                        'Ethan James',
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
                        padding: const EdgeInsets.only(top:8.0),
                        child: Container(
                          width: 110,
                          height: 30,
                          child: ElevatedButton.icon(
                            onPressed: () {},
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
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
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
          _bars(Icons.language, 'Language', null),
          SizedBox(height: 10,),
          _bars(Icons.notifications, 'Notifications', null),
          SizedBox(height: 10,),
          _bars(Icons.menu_book_sharp, 'Enrolled Courses', null),
          SizedBox(height: 10,),
          _bars(Icons.lock, 'Change Password', null),
          SizedBox(height: 10,),
          _bars(Icons.question_mark_outlined, 'Help & Support', null),
          SizedBox(height: 10,),
          _bars(Icons.logout, 'Logout', null),
        ],
      ),
    );
  }

  Widget _bars(IconData prefix, String label, IconData? suffix) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
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
          (suffix==null) ? Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 15,
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }
}



