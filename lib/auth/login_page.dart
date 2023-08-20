import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/widgets.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  void signInUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userController.text,
        password: passController.text,
      );
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
                        Icon(Icons.agriculture_rounded,
                            size: 125.0, color: Colors.grey[800]),
                        const SizedBox(height: 25.0),
                        Text('Welcome Back! You\'ve been missed!',
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
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: Colors.grey[800],
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        MyButton(
                          text: "Sign In",
                          ontap: signInUser,
                        ),
                        const SizedBox(height: 25.0),
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
                        const SizedBox(height: 50.0),
                        MyTile(
                          image: "lib/images/google.png",
                          company: "Google",
                        ),
                        const SizedBox(height: 10.0),
                        MyTile(
                          image: "lib/images/microsoft.png",
                          company: "Microsoft",
                        ),
                        const SizedBox(height: 50.0),
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
                            const SizedBox(width: 5.0),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Text(
                                " Sign Up",
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
