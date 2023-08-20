import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  String imagePath;
  String name;
  final String email;
  String phoneNumber;
  String about;

  UserProfile({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.about,
  });

  static UserProfile currentUser = UserProfile(
    imagePath: 'lib/images/demo_profile.jpg',
    name: 'Enter Your Name',
    email: FirebaseAuth.instance.currentUser!.email!,
    phoneNumber: 'Enter Phone Number',
    about:
        'Empty bio...',
  );
}
