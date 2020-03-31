import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.red,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      elevation: 15,
      title: Text(
        "1000 Kelime",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}