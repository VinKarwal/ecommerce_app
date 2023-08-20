import 'dart:ui';
import 'package:ecommerce_app/screens/create_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/widgets.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passController.text == confirmPassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userController.text,
          password: passController.text,
        );
        Navigator.pop(context);
      } else if (passController.text != confirmPassController.text) {
        Navigator.pop(context);
        showErrorMessage("Passwords do not match");
      } else if (passController.text.length < 6) {
        Navigator.pop(context);
        showErrorMessage("Password must be at least 6 characters");
      } else {
        Navigator.pop(context);
        showErrorMessage("Please enter a valid email and password");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/vegetable-background.jpeg"),
                  fit: BoxFit.cover, // Align the image to the bottom
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50.0),
                        Icon(Icons.person_rounded,
                            size: 125.0, color: Colors.grey[800]),
                        const SizedBox(height: 25.0),
                        Text('Let\'s create an account for you!',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[800])),
                        const SizedBox(height: 25.0),
                        MyTextField(
                          controller: userController,
                          hint: 'Email',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          controller: passController,
                          hint: 'Password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          controller: confirmPassController,
                          hint: 'Confirm Password',
                          obscureText: true,
                        ),
                        // const SizedBox(height: 10),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 25.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Text(
                        //         "Forgot Password?",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .headlineSmall!
                        //             .copyWith(
                        //               color: Colors.grey[800],
                        //             ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: 20.0),
                        MyButton(
                          text: "Sign Up",
                          ontap: signUp,
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey[400],
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "or continue with",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey[800]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey[400],
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        MyTile(
                          image: "lib/images/google.png",
                          company: "Google",
                        ),
                        const SizedBox(height: 10.0),
                        MyTile(
                          image: "lib/images/microsoft.png",
                          company: "Microsoft",
                        ),
                        const SizedBox(height: 45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.grey[800]),
                            ),
                            const SizedBox(width: 7.0),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Text(
                                " Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.green[800]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
