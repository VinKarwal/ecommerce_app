import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String title;
  final String content;
  final void Function()? onPressed;
  const MyTextBox({super.key, required this.title, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.settings_rounded,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          Text(
            content,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
