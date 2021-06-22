import 'package:flutter/material.dart';
import 'package:projekt_szkola/pages/info_page.dart';

class InfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(),
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
