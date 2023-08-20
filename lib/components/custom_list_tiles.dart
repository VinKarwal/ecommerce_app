import 'package:flutter/material.dart';

class MyListTiles extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? ontap;
  const MyListTiles({super.key, required this.title, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: ontap,
    );
  }
}
