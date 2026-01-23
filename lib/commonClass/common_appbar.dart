import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 54,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search))
        ],
      );

  }
}
