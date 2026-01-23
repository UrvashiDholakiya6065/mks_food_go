import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import '../authenticationScreens/login_screen.dart';
import '../mainScreens/home_screen.dart';
import '../route/app_route.dart';
import '../sessionManage/shared_pref.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    userAuthBox = Hive.box('authUser');
    mobileBox = Hive.box('mobileOtp');

    navigateNext();
  }

  // void navigateNext() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   final isLoggedIn = await SharedPref().isLoggedIn();
  //   final mobile = await SharedPref().getUserMobileNum();
  //
  //   if (isLoggedIn && mobile != null) {
  //     final currentUser = mobileBox!.get(mobile);
  //
  //     if (currentUser != null) {
  //       appRoute.go('/HomeScreen', extra: currentUser);
  //     } else {
  //       appRoute.go('/LoginWithOtp');
  //     }
  //   } else {
  //     appRoute.go('/LoginWithOtp');
  //   }
  // }
  void navigateNext() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await SharedPref().isLoggedIn();

    if (isLoggedIn) {
      final allMobiles = mobileBox!.keys.toList();
      if (allMobiles.isNotEmpty) {
        final mobile = allMobiles.last;
        final currentUser = mobileBox!.get(mobile);
        if (currentUser != null) {
          appRoute.go('/HomeScreen', extra: currentUser);
          return;
        }
      }
    }

    // fallback to login
    appRoute.go('/LoginWithOtp');
  }

  Box? userAuthBox;
  Box? mobileBox;
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
