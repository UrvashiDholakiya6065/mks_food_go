import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commonClass/common_appbar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 0;

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
                        Text("Order",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),),
                        Text("\$16.48",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taxes",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),),
                        Text("\$0.3",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      ],
                    ),
                    SizedBox(height: 12,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery fees",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),),
                        Text("\$1.5",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600,),),
                        Text("\$18.19",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600)),
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
            SizedBox(height: 24,),
            Text("Payment methods",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
            SizedBox(height: 22),
            Container(
              height: 78,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff3C2F2F),
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
                            Text("Credit card",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.white),),
                            SizedBox(height: 8,),
                            Text("5105 **** **** 0505",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Color(0xff808080)),),
                          ],
                        )
                      ],
                    ),
                  ),
                  RadioListTile<int>(
                    value: 0,
                    groupValue: selectedValue,
                    onChanged: (val) {
                      setState(() {
                        selectedValue = val!;
                      });
                      print("Selected: $selectedValue");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
