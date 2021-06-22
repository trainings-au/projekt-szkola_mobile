import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_szkola/main.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}
