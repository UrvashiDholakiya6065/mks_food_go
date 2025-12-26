import 'package:flutter/material.dart';
import 'package:foodgo/mainScreens/home_screen.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:foodgo/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute,

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.white),
      ),

    );
  }
}