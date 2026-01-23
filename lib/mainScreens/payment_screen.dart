import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commonClass/common_appbar.dart';
import '../route/app_route.dart';
import 'food_cart_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 0;
  bool isChecked = true;

  double getFinalTotal() {
    return calculateCartTotal() + 0.3 + 1.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),

          child: CommonAppbar()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order summary",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200,
                width: double.infinity,
                // color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order",style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),),
                        Text("₹${calculateCartTotal()}",style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taxes",style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),),
                        Text("₹0.3",style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      ],
                    ),
                    SizedBox(height: 12,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery fees",style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),),
                        Text("₹1.5",style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600,),),
                        Text("₹${getFinalTotal()}",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Estimated delivery time:",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,),),
                        Text("15 - 30mins",style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14,),
            Text("Payment methods",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
            SizedBox(height: 22),
            Container(
              height: 78,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],


                  color: selectedValue==0?Color(0xff3C2F2F):Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12,),
                    child: Row(
                      children: [
                        Image.asset('assets/payment/payment.png',height: 44,),
                        SizedBox(width: 14,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Credit card",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: selectedValue==0?Colors.white:Color(0xff3C2F2F)),),
                            SizedBox(height: 8,),
                            Text("5105 **** **** 0505",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Color(0xff808080)),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: RadioListTile<int>(
                      activeColor:  selectedValue==0?Colors.white:Colors.black,
                      value: 0,
                      groupValue: selectedValue,
                      onChanged: (val) {
                        setState(() {
                          selectedValue = val!;
                        });
                        print("Selected: $selectedValue");
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(

              height: 78,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: selectedValue==1?Color(0xff3C2F2F):Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],

                  borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12,),
                    child: Row(
                      children: [
                        Image.asset('assets/payment/visa.png',height: 28,),
                        SizedBox(width: 14,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Debit card",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: selectedValue==1?Colors.white:Color(0xff3C2F2F)),),
                            SizedBox(height: 8,),
                            Text("3566 **** **** 0505",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Color(0xff808080)),),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 40,
                    child: RadioListTile<int>(
                      activeColor: selectedValue==1?Colors.white:Colors.black,
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (val) {
                        setState(() {
                          selectedValue = val!;
                        });
                        print("Selected: $selectedValue");
                      },
                    ),
                  ),
                ],
              ),
            ),
      SizedBox(height: 10,),

      Row(
      children: [
      Checkbox(
        value: isChecked,
        activeColor: Color(0xffef2a39),
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
      Expanded(
        child: Text(
          "Save card details for future payments",
          style: TextStyle(fontSize: 14),
        ),
      ),
      ],
    ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

        ),
        child:        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            SizedBox(height: 70,
              width: 74,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total price",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff808080)),),
                  SizedBox(height: 6,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '₹',
                          style: TextStyle(
                            color: Color(0xffef2a39),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: getFinalTotal().toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                appRoute.push('/PopupScreen');

              },

              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    color: Color(0xff3C2F2F),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text("Pay Now",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
