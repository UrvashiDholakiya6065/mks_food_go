import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/sessionManage/shared_pref.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../route/app_route.dart';

class SignupWithOtp extends StatefulWidget {
  final String mobileNumber;

  const SignupWithOtp({super.key, required this.mobileNumber});

  @override
  State<SignupWithOtp> createState() => _SignupWithOtpState();
}

class _SignupWithOtpState extends State<SignupWithOtp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  DateTime? pickedDate;
  Box? mobileBox;

  @override
  void initState() {
    super.initState();
    mobileBox = Hive.box('mobileOtp');

    if (mobileBox!.containsKey(widget.mobileNumber)) {
      final userData = Map<String, dynamic>.from(
        mobileBox!.get(widget.mobileNumber),
      );

      nameController.text = userData['name'] ?? '';
      emailController.text = userData['email'] ?? '';
      dobController.text = userData['dob'] ?? '';
      genderController.text = userData['gender'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 34,
        backgroundColor: Color(0xffef2a39),
        iconTheme: IconThemeData(color: Colors.white),
        surfaceTintColor: Color(0xffef2a39),
      ),
      // // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.30,
            width: double.infinity,
            color: Color(0xffef2a39),
            child: Positioned(
              bottom: 12,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                ).copyWith(bottom: 4),
                child: Text(
                  "Food Go",
                  style: GoogleFonts.lobster(
                    fontSize: screenWidth * 0.12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
              ),
              padding: const EdgeInsets.all(16).copyWith(top: 40),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.03),

                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Name is required';
                            }
                            if (value.length < 2) {
                              return 'Enter at least 2 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

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

                        SizedBox(height: screenHeight * 0.04),
                        TextFormField(

                          initialValue: widget.mobileNumber,
                          readOnly: true,
                          // enabled: false,
                          keyboardType: TextInputType.number,

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // controller: mobileController,
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

                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          controller: dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'DOB',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onTap: () async {
                            pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000, 1, 1),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              String formattedDate =
                                  "${pickedDate!.day.toString().padLeft(2, '0')}-${pickedDate!.month.toString().padLeft(2, '0')}-${pickedDate!.year}";
                              dobController.text = formattedDate;
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'DOB is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.04),

                        // TextFormField(
                        //   controller: genderController,
                        //   keyboardType: TextInputType.text,
                        //
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //   // controller: mobileController,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Gender is required';
                        //     }
                        //
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: 'Gender',
                        //     prefixIcon: Icon(Icons.phone),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //   ),
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              "Gender",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                             SizedBox(height: 8),

                            Row(
                              children: [
                                Radio<String>(
                                  value: "Male",
                                  groupValue: genderController.text,
                                  onChanged: (value) {
                                    setState(() {
                                      genderController.text = value!;
                                    });
                                  },
                                ),
                                 Text("Male"),

                                Radio<String>(
                                  value: "Female",
                                  groupValue: genderController.text,
                                  onChanged: (value) {
                                    setState(() {
                                      genderController.text = value!;
                                    });
                                  },
                                ),
                                 Text("Female"),

                                Radio<String>(
                                  value: "Other",
                                  groupValue: genderController.text,
                                  onChanged: (value) {
                                    setState(() {
                                      genderController.text = value!;
                                    });
                                  },
                                ),
                                 Text("Other"),
                              ],
                            ),



                          ],
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
                            // onPressed: () async {
                            //   FocusManager.instance.primaryFocus?.unfocus();
                            //   print("Signup button clicked");
                            //
                            //   if (_formKey.currentState!.validate()) {
                            //     setState(() => isLoading = true);
                            //     await Future.delayed(
                            //       const Duration(seconds: 2),
                            //     );
                            //
                            //     final userData = {
                            //       'name': nameController.text.trim(),
                            //       'email': emailController.text.trim(),
                            //       'mobileNumber': widget.mobileNumber,
                            //       'dob': dobController.text.trim(),
                            //       'gender': genderController.text.trim(),
                            //     };
                            //
                            //     mobileBox!.put(widget.mobileNumber, userData);
                            //     SharedPref().setUserMobileNum(
                            //       mobileNum: widget.mobileNumber,
                            //     );
                            //     setState(() => isLoading = false);
                            //     print(
                            //       "Signup Data store :::::${mobileBox?.values}",
                            //     );
                            //     // appRoute.go('/HomeScreen',extra: userData);
                            //     if (mobileBox!.containsKey(
                            //       widget.mobileNumber,
                            //     )) {
                            //       // appRoute.pop();
                            //       appRoute.go(
                            //         '/VerifyOtpScreen',
                            //         extra: userData,
                            //       );
                            //     } else {
                            //
                            //       appRoute.go('/UserProfileScreen');
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(content: Text("Updated")),
                            //       );
                            //     }
                            //   }
                            // },

                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();

                                if (_formKey.currentState!.validate()) {

                                  setState(() => isLoading = true);

                                  final alreadyExists =
                                  mobileBox!.containsKey(widget.mobileNumber);

                                  final userData = {
                                    'name': nameController.text.trim(),
                                    'email': emailController.text.trim(),
                                    'mobileNumber': widget.mobileNumber,
                                    'dob': dobController.text.trim(),
                                    'gender': genderController.text.trim(),
                                  };

                                  // save / update user
                                  mobileBox!.put(widget.mobileNumber, userData);
                                  await SharedPref().setUserMobileNum(
                                    mobileNum: widget.mobileNumber,
                                  );

                                  setState(() => isLoading = false);

                                  if (alreadyExists) {
                                    appRoute.go('/UserProfileScreen');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Profile Updated")),
                                    );
                                  } else {
                                    appRoute.go('/VerifyOtpScreen', extra: userData);
                                  }
                                }
                              },

                              child: isLoading
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : Text(
                                    mobileBox!.containsKey(widget.mobileNumber)
                                        ? "Update Profile"
                                        : "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),

                        SizedBox(height: 16),

                        mobileBox!.containsKey(widget.mobileNumber)
                            ? SizedBox()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      appRoute.go('/LoginWithOtp');
                                    },
                                    child:  Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Color(0xffef2a39),
                                      ),
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
}
