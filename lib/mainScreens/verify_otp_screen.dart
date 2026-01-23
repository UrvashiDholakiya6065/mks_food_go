import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../route/app_route.dart';
import '../sessionManage/sesstion_keys.dart';

class VerifyOtpScreen extends StatefulWidget {
  final Map userData;

  const VerifyOtpScreen({super.key,required this.userData});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  bool isLoading=false;
  final TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userOptBox=Hive.box('mobileOtp');
    print("get Otp Value ::::- ${userOptBox?.values}");
  }
  Box? userOptBox;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef2a39),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.50,
            width: double.infinity,
            color: Color(0xffef2a39),
            child: Center(
              child: Text(
                "Food Go",
                style: GoogleFonts.lobster(
                  fontSize: screenWidth * 0.12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
              ),
              padding: EdgeInsets.all(16).copyWith(top: 70),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 10),
                    Text(
                      "OTP sent to your mobile number",
                      style: TextStyle(color: Colors.grey),
                    ),

                    SizedBox(height: 30),

                    Pinput(
                      controller: otpController,
                      length: 6,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                      ),
                      onCompleted: (pin) {
                        print("Entered OTP: $pin");
                      },
                    ),
                    SizedBox(height: 30),

                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffef2a39),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () async {

                          final otp = otpController.text.trim();

                          if (otp.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("OTP is required")),
                            );
                            return;
                          }

                          if (otp.length != 6) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Enter 6 digit OTP")),
                            );
                            return;
                          }
                          final allOtp = "000000";

                          if (allOtp.contains(otpController.text.trim())) {
                            setState(() => isLoading = true);
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool(SesstionKeys.isLoggedIn, true);
                            await Future.delayed(const Duration(seconds: 2));
                            setState(() => isLoading = false);

                            appRoute.go('/HomeScreen',extra: widget.userData);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Invalid OTP")),
                            );
                          }
                        },
                        child: isLoading?(Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                        ),)):Text(
                          'Verify OTP',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Reset OTP?'),
                        TextButton(onPressed: (){
                          otpController.clear();
                        }, child: Text('Reset',style: TextStyle(color: Color(0xffef2a39)),))
                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
