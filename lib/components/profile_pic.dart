import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/models.dart';
import 'dart:io';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    super.key,
    required this.user,
  });

  final UserProfile user;

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _imageFile;
  @override
  Widget build(BuildContext context) {
    if (_imageFile != null) {
      widget.user.imagePath = _imageFile!.path;
    } else {
      AssetImage(widget.user.imagePath);
    }
    return Stack(
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: FileImage(File(widget.user.imagePath)),
              fit: BoxFit.cover,
              width: 128.0,
              height: 128.0,
              child: InkWell(
                onTap: () async {
                  try {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      setState(() {
                        _imageFile = File(pickedFile.path);
                      });
                    }
                  } catch (e) {
                    print('Image picking failed: $e');
                  }
                },
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.edit_rounded,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
