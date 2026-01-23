import 'package:foodgo/authenticationScreens/login_screen.dart';
import 'package:foodgo/mainScreens/bottom_app_bar.dart';
import 'package:foodgo/mainScreens/food_cart_screen.dart';
import 'package:foodgo/mainScreens/home_screen.dart';
import 'package:foodgo/mainScreens/payment_screen.dart';
import 'package:foodgo/mainScreens/user_profile_screen.dart';
import 'package:foodgo/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../authenticationScreens/login_with_otp.dart';
import '../authenticationScreens/signup_screen.dart';
import '../authenticationScreens/signup_with_otp.dart';
import '../mainScreens/customer_support_screen.dart';
import '../mainScreens/popup_screen.dart';
import '../mainScreens/verify_otp_screen.dart';
import '../mainScreens/wish_screen.dart';

GoRouter appRoute = GoRouter(
  initialLocation: '/SplashScreen',
  routes: [
    GoRoute(path: '/SplashScreen', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/LoginScreen', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/LoginWithOtp', builder: (context, state) => LoginWithOtp()),
    GoRoute(path: '/SignupWithOtp', builder: (context, state) {
      final number=state.extra as String;
      return SignupWithOtp(mobileNumber: number,);
    }),
    GoRoute(path: '/VerifyOtpScreen',builder: (context, state) {
      final rawUser = state.extra as Map;
      final user = Map<String, dynamic>.from(rawUser);
      return VerifyOtpScreen(userData: user);
      final userData = state.extra as Map<String, dynamic>;
      return VerifyOtpScreen(userData: userData);
    },),
    GoRoute(
      path: '/FoodCartScreen',
      builder: (context, state) => FoodCartScreen(),
    ),
    GoRoute(
      path: '/PaymentScreen',
      builder: (context, state) => PaymentScreen(),
    ),
    GoRoute(path: '/PopupScreen', builder: (context, state) => PopupScreen()),
    GoRoute(
      path: '/CustomerSupportScreen',
      builder: (context, state) => CustomerSupportScreen(),
    ),
    GoRoute(path: '/SignupScreen', builder: (context, state) => SignupScreen()),

    ShellRoute(
      builder: (context, state, child) {
        return BottomAppBarScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/HomeScreen',
          builder: (context, state) {
            // final extra = state.extra;
            // Map<String, dynamic> user;
            //
            // if (extra != null && extra is Map) {
            //   user = Map<String, dynamic>.from(extra);
            // } else {
            //   user = {};
            // }
            //
            // return HomeScreen(currentUser: user);
            // final rawUser = state.extra as Map;
            //
            // final user = Map<String, dynamic>.from(rawUser);
            return HomeScreen();
          },
        ),
        GoRoute(path: '/WishScreen', builder: (context, state) => WishScreen()),
        // GoRoute(
        //   path: '/UserProfileScreen',
        //   builder: (context, state) => UserProfileScreen(
        //     currentUser: state.extra as Map<String, dynamic>,
        //   ),
        // ),
        GoRoute(
          path: '/UserProfileScreen',
          builder: (context, state) {
            // final email = state.extra as Map<String, dynamic>;
            return UserProfileScreen();
          },
        ),


        // GoRoute(path: '/UserProfileScreen',builder: (context,state)=>UserProfileScreen()),
        // GoRoute(path: '/CustomerSupportScreen',builder: (context,state)=>CustomerSupportScreen()),
        // GoRoute(path: '/WishScreen',builder: (context,state)=>WishScreen()),
      ],
    ),
  ],
);
