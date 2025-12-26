import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

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

      case '/SearchScreen':
        selectedIndex = 1;

        break;

      case '/NotificationScreen':
        selectedIndex = 2;

        break;

      case '/UserProfileScreen':
        selectedIndex = 3;

        break;
    }

    return Scaffold(
      body: child,

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffef2a39),

        shape: const CircleBorder(),

        onPressed: () {
        },

        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: SizedBox(
        height: 80,

        child: ClipPath(
          clipper: BottomBarClipper(),

          child: Container(
            height: 70,

            color: const Color(0xffef2a39),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                _bottomItem(
                  icon: Icons.home,

                  index: 0,

                  selectedIndex: selectedIndex,

                  context: context,
                ),

                _bottomItem(
                  icon: Icons.search,

                  index: 1,

                  selectedIndex: selectedIndex,

                  context: context,
                ),

                const SizedBox(width: 60),

                _bottomItem(
                  icon: Icons.notifications,

                  index: 2,

                  selectedIndex: selectedIndex,

                  context: context,
                ),

                _bottomItem(
                  icon: Icons.person,

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
    required IconData icon,

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
            context.go('/SearchScreen');

            break;

          case 2:
            context.go('/NotificationScreen');

            break;

          case 3:
            context.go('/UserProfileScreen');

            break;
        }
      },

      child: Icon(
        icon,

        size: 26,

        color: isSelected ? Colors.white : Colors.white70,
      ),
    );
  }
}


class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double fabRadius = 38;

    final double centerX = size.width / 2;

    final path = Path();

    path.lineTo(0, 0);


    path.lineTo(centerX - fabRadius * 1.8, 0);

    // Left curve

    path.quadraticBezierTo(
      centerX - fabRadius * 1.3,

      0,

      centerX - fabRadius,

      fabRadius * 0.9,
    );

    // Deep FAB notch

    path.quadraticBezierTo(
      centerX,

      fabRadius * 1.5,

      centerX + fabRadius,

      fabRadius * 0.9,
    );

    // Right curve

    path.quadraticBezierTo(
      centerX + fabRadius * 1.4,

      0,

      centerX + fabRadius * 1.8,

      0,
    );

    // Right flat

    path.lineTo(size.width, 0);

    // Bottom rectangle

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
