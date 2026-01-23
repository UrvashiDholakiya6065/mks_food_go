  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:hive_flutter/adapters.dart';
  import '../route/app_route.dart';
import '../sessionManage/shared_pref.dart';

  class LoginWithOtp extends StatefulWidget {
    const LoginWithOtp({super.key});

    @override
    State<LoginWithOtp> createState() => _LoginWithOtpState();
  }

  class _LoginWithOtpState extends State<LoginWithOtp> {

    @override
    void initState() {
      super.initState();
     userOtpBox= Hive.box('mobileOtp');
      final mobile = mobileController;
    }
    Box? userOtpBox;
    final TextEditingController mobileController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool isLoading = false;

    @override
    Widget build(BuildContext context) {
      final screenHeight = MediaQuery.of(context).size.height;
      final screenWidth = MediaQuery.of(context).size.width;

      return Scaffold(

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
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: mobileController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Number is required';
                            }
                            if (value.length != 10) {
                              return 'Enter exactly 10 digits';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
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
                            // onPressed: () async {
                            //   if (_formKey.currentState!.validate()) {
                            //     final email = emailController.text.trim();
                            //
                            //     setState(() {
                            //       isLoading = true;
                            //     });
                            //     userAuthBox = Hive.box('authUser');
                            //
                            //     await Future.delayed(const Duration(seconds: 3));
                            //
                            //     final savedUser = userAuthBox!.get(email);
                            //
                            //     if (savedUser == null) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(
                            //             content: Text("Please first signup")),
                            //       );
                            //       return;
                            //     }
                            //
                            //     if (savedUser['email'] ==
                            //         emailController.text.trim() &&
                            //         savedUser['password'] ==
                            //             passwordController.text.trim()) {
                            //       appRoute.go('/HomeScreen');
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(
                            //             content: Text("Invalid email or password")),
                            //       );
                            //     }
                            //     setState(() {
                            //       isLoading = false;
                            //     });
                            //   }
                            //   },
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              if (!_formKey.currentState!.validate()) return;

                              setState(() => isLoading = true);
                              await Future.delayed(const Duration(seconds: 2));

                              final mobile = mobileController.text.trim();

                              if (!userOtpBox!.containsKey(mobile)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Mobile not registered, please signup")),
                                );
                                setState(() => isLoading = false);
                                appRoute.push('/SignupWithOtp', extra: mobile);
                                return;
                              }

                              final userData = Map<String, dynamic>.from(userOtpBox!.get(mobile));

                              await SharedPref().setUserMobileNum(mobileNum: mobile);

                              setState(() => isLoading = false);

                              appRoute.go('/VerifyOtpScreen', extra: userData);
                            },


                            child: isLoading?(Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                            ),)):Text(
                              'Send OTP',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                appRoute.push('/SignupWithOtp',extra: mobileController.text);
                              }, child: Text(
                              "Sign Up",
                              style: TextStyle(color: Color(0xffef2a39)),
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/auth/google.png', height: 30),
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/auth/facebook.png', height: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
