import 'package:ecommerce_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../auth/auth_page.dart';
import '../screens/screens.dart';
import 'widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOutUser() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green[600],
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  FileImage(File(UserProfile.currentUser.imagePath)),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            accountEmail: Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: TextStyle(color: Colors.green[600]),
            ),
            accountName: Text(
              UserProfile.currentUser.name,
              style: TextStyle(color: Colors.green[600]),
            ),
          ),
          MyListTiles(
            title: "Home",
            icon: Icons.home_rounded,
            ontap: () {
              Navigator.pushNamed(context, MyHomePage.routeName);
            },
          ),
          const Divider(
            thickness: 2,
          ),
          MyListTiles(
            title: "Profile",
            icon: Icons.person_rounded,
            ontap: () {
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
          ),
          const Divider(
            thickness: 2,
          ),
          MyListTiles(
            title: "Sign out",
            icon: Icons.logout_rounded,
            ontap: () {
              signOutUser();
              Navigator.pushNamed(context, AuthPage.routeName);
            },
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
