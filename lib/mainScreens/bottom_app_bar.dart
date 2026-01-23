import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../route/app_route.dart';

class BottomAppBarScreen extends StatelessWidget {
  final Widget child;

  const BottomAppBarScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;

    int selectedIndex = 0;

    switch (path) {
      case '/HomeScreen':
        selectedIndex = 0;

        break;

      case '/UserProfileScreen':
        selectedIndex = 1;

        break;

      case '/CustomerSupportScreen':
        selectedIndex = 2;

        break;

      case '/WishScreen':
        selectedIndex = 3;
        break;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffef2a39),

        shape: CircleBorder(),

        onPressed: () {
          appRoute.push('/FoodCartScreen');
        },
        child: Icon(Icons.shopping_cart, size: 18, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: SizedBox(
        height: 80,

        child: ClipPath(
          clipper: BottomBarClipper(),

          child: Container(
            height: 70,

            color: Color(0xffef2a39),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                _bottomItem(
                  icon: 'assets/bottomBar/home.png',

                  index: 0,

                  selectedIndex: selectedIndex,

                  context: context,
                ),

                _bottomItem(
                  icon: 'assets/bottomBar/person.png',

                  index: 1,

                  selectedIndex: selectedIndex,

                  context: context,
                ),

                const SizedBox(width: 60),

                _bottomItem(
                  icon: 'assets/bottomBar/vector.png',

                  index: 2,

                  selectedIndex: selectedIndex,

                  context: context,
                ),

                _bottomItem(
                  icon: 'assets/bottomBar/heart.png',

                  index: 3,

                  selectedIndex: selectedIndex,

                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomItem({
    required String icon,

    required int index,

    required int selectedIndex,

    required BuildContext context,
  }) {
    final isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            context.go('/HomeScreen');

            break;

          case 1:
            context.push('/UserProfileScreen');

            break;

          case 2:
            context.push('/CustomerSupportScreen');

            break;

          case 3:
            context.push('/WishScreen');

            break;
        }
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 18,
            color: isSelected ? Colors.white : Colors.white70,
          ),
          SizedBox(height: 8),
          isSelected
              ? CircleAvatar(radius: 2, backgroundColor: Colors.white)
              : SizedBox(),
        ],
      ),
    );
  }
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double fabRadius = 36;
    final double centerX = size.width / 2;

    Path path = Path();

    path.lineTo(0, 0);

    path.lineTo(centerX - fabRadius * 2, 0);

    path.cubicTo(
      centerX - fabRadius * 1.6,
      0,
      centerX - fabRadius * 1.4,
      fabRadius * 0.6,
      centerX - fabRadius,
      fabRadius,
    );

    path.cubicTo(
      centerX - fabRadius * 0.5,
      fabRadius * 1.4,
      centerX + fabRadius * 0.5,
      fabRadius * 1.4,
      centerX + fabRadius,
      fabRadius,
    );

    path.cubicTo(
      centerX + fabRadius * 1.4,
      fabRadius * 0.6,
      centerX + fabRadius * 1.6,
      0,
      centerX + fabRadius * 2,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
