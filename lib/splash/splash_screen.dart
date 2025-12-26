import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/mainScreens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../mainScreens/bottom_app_bar.dart';
import '../route/app_route.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      appRoute.go('/HomeScreen');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfffd848d),
              Color(0xffef2a39),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 180),

            Text(
              "Food Go",
              style: GoogleFonts.lobster(
                  fontSize: 54,
                  color: Colors.white
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/splash/splash_burger1.png',
                      width: 180,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 64,
                    child: Image.asset(
                      'assets/splash/splash_burger2.png',
                      width: 200,
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
