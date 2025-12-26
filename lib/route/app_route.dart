import 'package:flutter/material.dart';
import 'package:foodgo/mainScreens/bottom_app_bar.dart';
import 'package:foodgo/mainScreens/food_cart_screen.dart';
import 'package:foodgo/mainScreens/home_screen.dart';
import 'package:foodgo/mainScreens/notification_screen.dart';
import 'package:foodgo/mainScreens/payment_screen.dart';
import 'package:foodgo/mainScreens/search_screen.dart';
import 'package:foodgo/mainScreens/user_profile_screen.dart';
import 'package:foodgo/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../mainScreens/food_detail_screen.dart';

final GoRouter appRoute=GoRouter(
    initialLocation: '/SplashScreen',
    routes: [
      GoRoute(path: '/SplashScreen',builder: (context,state)=>SplashScreen()),
      GoRoute(path: '/FoodCartScreen',builder: (context,state)=>FoodCartScreen()),
      GoRoute(path: '/PaymentScreen',builder: (context,state)=>PaymentScreen()),
      GoRoute(
        path: '/FoodDetailScreen',
        builder: (context, state) {
          final item = state.extra as Map<String, dynamic>;

          return FoodDetailScreen(
            foodName: item['foodName'],
            foodSubName: item['foodSubName'],
            foodImage: item['foodImage'],
            foodRate: item['foodRate'],
            foodDis: item['foodDis'],
            mint: item['mint'],
          );
        },
      ),


      ShellRoute(
          builder: (context, state, child){
            return BottomAppBarScreen(child: child,);
          },
          routes: [
            GoRoute(path: '/HomeScreen',builder: (context,state)=>HomeScreen()),
            GoRoute(path: '/SearchScreen',builder: (context,state)=>SearchScreen()),
            GoRoute(path: '/NotificationScreen',builder: (context,state)=>NotificationScreen()),
            GoRoute(path: '/UserProfileScreen',builder: (context,state)=>UserProfileScreen()),
      ])
]);