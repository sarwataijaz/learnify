import 'package:flutter/material.dart';
import 'package:learnify/Screens/Profile/edit_profile_screen.dart';
import 'package:learnify/Screens/Profile/profile_screen.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({super.key});

  @override
  State<ProfileNavigation> createState() => _ProfileNavigationState();
}

  GlobalKey<NavigatorState> profileNavigatorKey = GlobalKey<NavigatorState>();

class _ProfileNavigationState extends State<ProfileNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: profileNavigatorKey, // Make sure this is passed properly
      onGenerateRoute: (RouteSettings settings) {
        print('Generating route for ${settings.name}');  // This will print if onGenerateRoute is called
        if (settings.name == '/EditProfile') {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) => EditProfileScreen(),
          );
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => ProfileScreen(),
        );
      },
    );
  }
}
