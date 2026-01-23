import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonTextField({
  required String label,
  required IconData icon,
  required TextInputType type,
  required TextEditingController controller,
  required String requiredMsg,  bool obscureText=false,String reg="",String invilideEmail="",
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      value == null || value.isEmpty ? requiredMsg:null;
      if (!RegExp(
        reg,
      ).hasMatch(value.toString())) {
        return invilideEmail;
      }
return null;
    },
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
