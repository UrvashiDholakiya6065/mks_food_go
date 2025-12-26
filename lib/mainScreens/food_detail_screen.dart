import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';

import '../commonClass/common_appbar.dart';

class FoodDetailScreen extends StatefulWidget {
  final String foodName;
  final String foodSubName;
  final String foodImage;
  final String foodRate;
  final String foodDis;
  final String mint;

  const FoodDetailScreen({
    super.key,
    required this.foodName,
    required this.foodSubName,
    required this.foodImage,
    required this.foodRate,
    required this.foodDis,
    required this.mint,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  double value = 0.7;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),

          child: CommonAppbar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image(image: AssetImage(widget.foodImage),height: 240,),
              SizedBox(height: 16,),
              Row(
                children: [
                  Text(
                    widget.foodName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 4),
                  Text(
                    widget.foodSubName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    widget.foodRate,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 4),
                  Text('-'),
                  SizedBox(width: 4),
                  Text(
                    widget.mint,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Container(
                // color: Colors.red,/
                height: 100,
                child: Text(
                  widget.foodDis,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    // color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            onChanged: (v) => setState(() => value = v),
                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mild",
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                "Hot",
                                style: TextStyle(color: Color(0xffef2a39)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Portion',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
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
                                    width: 19,
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
                      ],
                    ),
                  ),
                ],
              ),

            ],
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
            Container(
              height: 50,
              width: 74,
              decoration: BoxDecoration(
                color: Color(0xffef2a39),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "\$9.99",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                appRoute.push('/FoodCartScreen');
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xff3c2f2f),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("ORDER NOW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
