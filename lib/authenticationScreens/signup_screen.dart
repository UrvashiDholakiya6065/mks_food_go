import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

import '../commonClass/common_textfield.dart';
import '../sessionManage/shared_pref.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Box? userAuthBox;
  File? fileImage;

  bool isLoading = false;



  @override
  void initState() {
    super.initState();
    userAuthBox=Hive.box('authUser');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.30,
            width: double.infinity,
            color: const Color(0xffef2a39),
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
              height: screenHeight * 0.80,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
              ),
              padding: const EdgeInsets.all(16).copyWith(top: 40),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              showDialogBox();
                            },
                            child: (fileImage != null)
                            ? CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(fileImage!),
                        )
                            : CircleAvatar(
                          radius: 70,
                          child: Icon(CupertinoIcons.camera_on_rectangle),
                        ),
                        ),

                        SizedBox(height: screenHeight * 0.03),


                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: firstNameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'First name is required';
                            }
                            if (value.length < 2) {
                              return 'Enter at least 2 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,


                          controller: lastNameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Last name is required';
                            }
                            if (value.length < 2) {
                              return 'Enter at least 2 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),


                        TextFormField(
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
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
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
                              backgroundColor: const Color(0xffef2a39),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            // onPressed: () async {
                            //   if (_formKey.currentState!.validate()) {
                            //     if (fileImage == null) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(content: Text("Please select a profile image")),
                            //       );
                            //       return;
                            //     }
                            //
                            //     setState(() {
                            //       isLoading = true;
                            //     });
                            //
                            //     await Future.delayed(const Duration(seconds: 1));
                            //     final email = emailController.text.trim();
                            //
                            //     final savedUser = userAuthBox!.get(email);
                            //
                            //     if (savedUser != null) {
                            //       setState(() {
                            //         isLoading = false;
                            //       });
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(content: Text("User already exists, please login")),
                            //       );
                            //       return;
                            //     }
                            //
                            //     print("F Name: ${firstNameController.text}");
                            //     print("L Name: ${lastNameController.text}");
                            //     print("Email: ${emailController.text}");
                            //     print("Password: ${passwordController.text}");
                            //
                            //     // final userData={
                            //     //   'FName':firstNameController.text,
                            //     //   'LName':lastNameController.text,
                            //     //   'email':emailController.text,
                            //     //    'password':passwordController.text,
                            //     //   'image':fileImage!.path,
                            //     // };
                            //
                            //     // userAuthBox!.put('authUser',userData);
                            //     userAuthBox!.put(
                            //       emailController.text,
                            //       {
                            //         'FName': firstNameController.text,
                            //         'LName': lastNameController.text,
                            //         'email': emailController.text,
                            //         'password': passwordController.text,
                            //         'image': fileImage!.path,
                            //       },
                            //     );
                            //
                            //     setState(() {
                            //       isLoading = false;
                            //     });
                            //     setState(() {});
                            //     appRoute.go('/HomeScreen');
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //        SnackBar(
                            //         content: Text("Signup Successful"),
                            //       ),
                            //     );
                            //   }
                            // },
                            onPressed: () async {
                              print("Signup button clicked");
                              if (_formKey.currentState!.validate()) {

                                if (fileImage == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Please select a profile image")),
                                  );
                                  return;
                                }



                                appRoute.go('/HomeScreen');

                                setState(() => isLoading = true);

                                final email = emailController.text.trim();

                                final existingUser = userAuthBox!.get(email);

                                if (existingUser != null) {
                                  setState(() => isLoading = false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("User already exists, please login")),
                                  );
                                  return;
                                }

                                final userData = {
                                  'FName': firstNameController.text.trim(),
                                  'LName': lastNameController.text.trim(),
                                  'email': email,
                                  'password': passwordController.text.trim(),
                                  'image': fileImage!.path,
                                };

                                userAuthBox!.put(email, userData);

                                print("All user :- ${userAuthBox!.keys}");
                                await SharedPref().setUserDataPref(email: email);


                                setState(() => isLoading = false);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Signup Successful")),
                                );

                                appRoute.go('/HomeScreen',extra: userData);
                              }
                            },

                            child:  isLoading?Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                            ),):Text(
                              'Sign up',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),

                         SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                appRoute.go('/LoginScreen');
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Color(0xffef2a39)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  pickImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        fileImage = File(image.path);

      });
    }
  }

  pickImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        fileImage = File(image.path);

      });
    }
  }

  showDialogBox() {
    return showDialog(
        context: context,
        builder: (context) {

            return AlertDialog(
              title: Text('Select From'),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        pickImageFromCamera();
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.camera_on_rectangle),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Camera'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        pickImageFromGallery();
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Gallery')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );

        });
  }

}
