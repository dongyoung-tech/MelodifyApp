import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("MELODIFY"),
      leading: Padding(
        padding: const EdgeInsets.only(top: 13, left: 13, bottom: 13, right: 9),
        child: Container(
          width: 30,
          height: 30,
          child: Image.asset(
            'assets/music.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
