import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../commonClass/common_appbar.dart';
import '../commonClass/common_container.dart';
import '../route/app_route.dart';

class FoodCartScreen extends StatefulWidget {
  const FoodCartScreen({super.key});

  @override
  State<FoodCartScreen> createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  double value = 0.7;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar:  PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),

        child: CommonAppbar()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Container(
                  height: 240,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/cart/burger1.png', height: 176),
                      Column(
                        children: [
                          Container(
                            height: 240,
                            width:170,
                            // color: Colors.yellow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Customize ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Your Burger\nto Your Tastes. Ultimate\nExperience",style: TextStyle(color: Colors.black)
                                      ),
                                    ],
                                  ),
                                ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  // color: Colors.yellow,
          
                                      Text(
                                        'Spicy',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          thumbShape: const RoundSliderThumbShape(
                                            enabledThumbRadius: 8,
                                          ),
                                          thumbColor: Colors.white,
                                          overlayColor: Colors.transparent,
                                          activeTrackColor: Color(0xffef2a39),
                                        ),
                                        child: Slider(
                                          value: value,
                                          min: 0,
                                          max: 1,
                                          onChanged: (v) =>
                                              setState(() => value = v),
                                        ),
                                      ),
          
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width * 0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Mild",
                                              style: TextStyle(color: Colors.green),
                                            ),
                                            Text(
                                              "Hot",
                                              style: TextStyle(
                                                color: Color(0xffef2a39),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Text(
                                        'Portion',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                Container(
                                  height:40,
                                  // color: Colors.blue,
                                  child:         Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (1 < quantity) {
                                            quantity--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 36,
                                        width: 38,
                                        decoration: BoxDecoration(
                                          color: Color(0xffef2a39),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 3,
                                            width: 16,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    // SizedBox(width: 6,),
                                    Text(quantity.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                    SizedBox(width: 8),
          
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: Container(
                                        height: 36,
                                        width: 38,
                                        decoration: BoxDecoration(
                                          color: Color(0xffef2a39),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
          
                        ],
                      ),
          
                  ),
                Text("Toppings",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child: Row(
                    children: [
                      CommonContainer(image: 'assets/cart/tomato.png',name: "Tomato",),
                      SizedBox(width: 16,),
                      CommonContainer(image: 'assets/cart/onions.png',name: "Onions",),
                      SizedBox(width: 16,),
                      CommonContainer(image: 'assets/cart/pickles.png',name: "Pickles",),
                      SizedBox(width: 16,),
                      CommonContainer(image: 'assets/cart/bacons.png',name: "Bacons",),
                    ],
                  ),
                ),
                SizedBox(height: 18,),
                Text("Side options",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child: Row(
                    children: [
                      CommonContainer(image: 'assets/cart/fries.png',name: "Fries",),
                      SizedBox(width: 16,),
                      CommonContainer(image: 'assets/cart/coleslaw.png',name: "Coleslaw",),
                      SizedBox(width: 16,),
                      CommonContainer(image: 'assets/cart/salad.png',name: "Salad",),
                      SizedBox(width: 16,),
                      CommonContainer(image: 'assets/cart/fryonions.png',name: "Onions",),
                    ],
                  ),
                ),
          SizedBox(height: 34,),
         
              ],
            ),
          ),
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
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  SizedBox(height: 6,),
                  Text("\$16.49",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                appRoute.push('/PaymentScreen');

              },

              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                      color: Color(0xffef2a39),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text("ORDER NOW",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
