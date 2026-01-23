import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Box? userAuthBox;
  bool isLoading = false;
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    userAuthBox = Hive.box('authUser');
  }


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
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      obscureText:  !isPasswordVisible,

                      decoration: InputDecoration(
                       suffixIcon: IconButton(
                      icon: Icon(
                      isPasswordVisible
                      ? Icons.visibility
                        : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
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
                          if (!_formKey.currentState!.validate()) return;

                          setState(() => isLoading = true);


                          await Future.delayed(const Duration(seconds: 2));
                          final email = emailController.text.trim();

                          final savedUser = userAuthBox!.get(email);

                          if (savedUser == null) {
                            setState(() => isLoading = false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("User not found, signup first")),
                            );
                            return;
                          }
                          if (savedUser['password'] != passwordController.text.trim()) {
                            setState(() => isLoading = false);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text("Incorrect password")));
                            return;
                          }

                          setState(() => isLoading = false);

                          appRoute.go('/HomeScreen',extra: savedUser);
                        },

                        child: isLoading?(Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                        ),)):Text(
                          'Login',
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
                            appRoute.go('/SignupScreen');
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
        ],
      ),
    );
  }
}
