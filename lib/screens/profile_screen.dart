import 'package:ecommerce_app/components/custom_app_bar.dart';
import '../models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/widgets.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserProfile user = UserProfile.currentUser;

  void signOutUser() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> editField(BuildContext context, String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade400,
        title: Row(
          children: [
            Center(
              child: Text(
                "Edit $field",
              ),
            ),
          ],
        ),
        content: TextField(
          autofocus: true,
          cursorColor: Colors.green,
          onChanged: (value) => newValue = value,
          decoration: InputDecoration(
            focusColor: Colors.green[700],
            hintText: "Enter new $field",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade700),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[700],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "Cancel",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(newValue),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[700],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "Save",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (newValue != "") {
      updateUserField(field, newValue);
    }
  }

  void updateUserField(String field, String newValue) {
    if (field == 'Username') {
      setState(() {
        user.name = newValue;
      });
    } else if (field == 'Phone Number') {
      setState(() {
        user.phoneNumber = newValue;
      });
    } else if (field == 'About Me') {
      setState(() {
        user.about = newValue;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              ProfilePic(
                user: user,
              ),
              SizedBox(height: 10.0),
              Text(
                user.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey.shade700),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      "My Account Details",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              MyTextBox(
                title: "Username",
                content: user.name,
                onPressed: () => editField(context, 'Username'),
              ),
              MyTextBox(
                title: "Phone Number",
                content: user.phoneNumber,
                onPressed: () => editField(context, 'Phone Number'),
              ),
              MyTextBox(
                title: "About Me",
                content: user.about,
                onPressed: () => editField(context, 'About Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
