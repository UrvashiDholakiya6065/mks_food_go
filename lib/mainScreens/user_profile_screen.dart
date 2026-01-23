import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:foodgo/sessionManage/shared_pref.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sessionManage/sesstion_keys.dart';

class UserProfileScreen extends StatefulWidget {
  // final Map<String, dynamic> userData;



  UserProfileScreen({super.key,});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}
class _UserProfileScreenState extends State<UserProfileScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //    Hive.box('authUser');
  //    print("Current ${widget.userData}");
  //
  //    Hive.box('mobileOtp');
  //
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   mobileBox=Hive.box('mobileOtp');
  //  print("Otp Details ::::-${mobileBox?.values}");
  // }
  Box? mobileBox;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    mobileBox = Hive.box('mobileOtp');
    loadUserData();
  }

  void loadUserData() async {
    String? mobile = await SharedPref().getUserMobileNum();

    if (mobile != null && mobileBox!.containsKey(mobile)) {
      userData = Map<String, dynamic>.from(mobileBox!.get(mobile));
      setState(() {});
      print("Profile loaded: $userData");
    } else {
      print("No data found for mobile: $mobile");
    }
  }


  @override
  Widget build(BuildContext context) {
    // final user = mobileBox!.get(widget.userData['mobileNumber']);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor:  Color(0xffEF2A39),

        backgroundColor: Color(0xffEF2A39),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
                onTap: () async {
                  String? mobile = await SharedPref().getUserMobileNum();
                  if (mobile != null) {
                    showDeleteDialog(context, mobile);
                  } else {
                    print("No mobile number found in SharedPreferences");
                  }
                },
                child: Icon(Icons.delete, color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 700,
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 100,
                              decoration:  BoxDecoration(
                                color: Color(0xffEF2A39),
                              ),
                            ),
                          ),
                    Positioned(
                      top: 70,
                      left: 0,
                      right: 0,

                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 14,
                              offset:  Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            // Text("Name: ${widget.userData['FName']} ${widget.userData['LName']}"),
                            // Text("Email: ${widget.userData['email']}"),
                            Text("Name: ${userData?['name']}"),
                            Text("Email: ${userData?['email']}"),
                            field(
                              "Delivery address",
                              "123 Main St Apartment 4A, New York, NY",
                            ),
                             field("Password", "••••••••"),

                             SizedBox(height: 10),

                            arrowItem("Payment Details"),
                            arrowItem("Order history"),
                             SizedBox(height: 22),

                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      final mobile = await SharedPref().getUserMobileNum();

                                      if (mobile != null) {
                                        appRoute.push(
                                          '/SignupWithOtp',
                                          extra: mobile,
                                        );
                                      }
                                    },

                                    child: Container(
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Icon(Icons.edit,
                                              color: Colors.white, size: 16),
                                          SizedBox(width: 6),
                                          Text(
                                            "Edit Profile",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                 SizedBox(width: 12),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      showLogoutDialog(context);
                                    },
                                    child: Container(
                                      height: 44,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Text(
                                            "Log out",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Icon(Icons.logout,
                                              color: Colors.red, size: 16),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 20,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xffEF2A39),
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child:userData?['image'] != null &&
                              File(userData?['image']).existsSync()
                              ? Image.file(
                            File(userData?['image']),
                            height: 96,
                            width: 96,
                            fit: BoxFit.cover,
                          )
                              : Icon(
                            Icons.person,
                            size: 96,
                            color: Colors.grey,
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget field(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
           SizedBox(height: 6),
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: GoogleFonts.roboto(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget arrowItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
           Spacer(),
           Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title:  Text("Log out"),
          content:  Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                appRoute.pop(context);
              },
              child:  Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xffEF2A39),
              ),
              onPressed: () {
              SharedPref().logoutPrefMobilNum();
                        },
              child:  Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
  void showDeleteDialog(BuildContext context,String mobileNumber) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title:  Text("Delete Account"),
          content:  Text("Are you sure you want to delete account?"),
          actions: [
            TextButton(
              onPressed: () {
                appRoute.pop(context);
              },
              child:  Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xffEF2A39),
              ),
              onPressed: () {
                deleteUserFromHive(mobileNumber);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Delete Account Successfully")),
                );
                appRoute.go('/LoginWithOtp');
              },
              child:  Text(
                "Delete Account",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
  Future<void> deleteUserFromHive(String mobileNumber) async {
    final mobileBox = Hive.box('mobileOtp');

    if (mobileBox.containsKey(mobileNumber)) {
      await mobileBox.delete(mobileNumber);
      print("User with mobile $mobileNumber deleted from Hive");

    } else {
      print("User with mobile $mobileNumber not found in Hive");
    }
  }

//
  //  Future<void> logoutPref() async {
  //    final SharedPreferences prefs = await SharedPreferences.getInstance();
  //    final email = await prefs.remove(SesstionKeys.email);
  //    // final password = await prefs.remove(SesstionKeys.password);
  //    // appRoute.go('/LoginScreen');
  //    appRoute.go('/LoginWithOtp');
  //    print("remove email shared pref  $email");
  //    // print("remove password shared pref  $password");
  //  }
  // Future<void> logoutPrefMobile() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final email = await prefs.remove(SesstionKeys.mobileKey);
  //   // final password = await prefs.remove(SesstionKeys.password);
  //   // appRoute.go('/LoginScreen');
  //   appRoute.go('/LoginWithOtp');
  //   print("remove email shared pref  $email");
  //   // print("remove password shared pref  $password");
  // }
}
