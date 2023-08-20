import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.green),
      elevation: 0,
      centerTitle: true,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[700],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            },
            icon: Icon(Icons.favorite_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
