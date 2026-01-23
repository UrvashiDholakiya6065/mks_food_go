import 'package:flutter/material.dart';
import 'package:foodgo/utils/list.dart';
import '../commonClass/common_appbar.dart';
import '../commonClass/common_container.dart';
import '../route/app_route.dart';

int calculateCartTotal() {
  int total = 0;

  for (var item in cartList) {
    total += item['totalPrice'] as int;
  }

  return total;
}

class FoodCartScreen extends StatefulWidget {
  const FoodCartScreen({super.key});

  @override
  State<FoodCartScreen> createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  double value = 0.7;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        appRoute.pop(cartList);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),

          child: CommonAppbar(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
      
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          // color: Colors.blue,
                          child: Row(

                            children: [
                              Container(
                                // color: Colors.yellow,
                                height: 60,
                                child: Image.asset(
                                  cartList[index]['foodImage'],
                                  width: 54,
                                ),
                              ),
                              SizedBox(width: 6,),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${cartList[index]['foodName']}\t${cartList[index]['foodSubName']}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          "250g",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),

                                Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Color(0xfffff0f3),
                                        border: Border.all(color: Color(0xffef2a39)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (1 < cartList[index]['qty']) {
                                                    cartList[index]['qty']--;
                                                    cartList[index]['totalPrice'] =
                                                        cartList[index]['price'] * cartList[index]['qty'];
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 12,
                                                color: Colors.black87,
                                              ),
                                            ),

                                            Text(
                                              cartList[index]['qty'].toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  cartList[index]['qty']++;
                                                  cartList[index]['totalPrice'] =
                                                      cartList[index]['price'] * cartList[index]['qty'];
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 12,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 4,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 34),
                                      child: Text("₹${cartList[index]['totalPrice']}",style: TextStyle(fontSize: 12),),
                                    )
                                  ],
                                ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    "Toppings",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CommonContainer(
                          image: 'assets/cart/tomato.png',
                          name: "Tomato",
                        ),
                        SizedBox(width: 16),
                        CommonContainer(
                          image: 'assets/cart/onions.png',
                          name: "Onions",
                        ),
                        SizedBox(width: 16),
                        CommonContainer(
                          image: 'assets/cart/pickles.png',
                          name: "Pickles",
                        ),
                        SizedBox(width: 16),
                        CommonContainer(
                          image: 'assets/cart/bacons.png',
                          name: "Bacons",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Side options",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CommonContainer(
                          image: 'assets/cart/fries.png',
                          name: "Fries",
                        ),
                        SizedBox(width: 16),
                        CommonContainer(
                          image: 'assets/cart/coleslaw.png',
                          name: "Coleslaw",
                        ),
                        SizedBox(width: 16),
                        CommonContainer(
                          image: 'assets/cart/salad.png',
                          name: "Salad",
                        ),
                        SizedBox(width: 16),
                        CommonContainer(
                          image: 'assets/cart/fryonions.png',
                          name: "Onions",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 70,
                width: 74,
                // color: Colors.yellow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 6),
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
                            text: calculateCartTotal().toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      
              GestureDetector(
                onTap: () {
                  appRoute.push('/PaymentScreen');
                },
      
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Color(0xffef2a39),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
