
import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:foodgo/utils/app_loger.dart';
import 'list.dart';

class Food extends StatefulWidget {
  final List<Map<String, dynamic>> foodList;
  final int index;

  const Food({super.key, required this.foodList, required this.index});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  int calculateTotalPrice() {
    final item = widget.foodList[widget.index];
    final int price = item['price'];
    final int qty = item['qty'];

    return price * qty;
  }

  double value = 0.7;
  final ValueNotifier<int> qtyNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 570,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(bottom: 70),
              // width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          widget.foodList[widget.index]['foodImage'],
                          height: 120,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            widget.foodList[widget.index]['foodName'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            widget.foodList[widget.index]['foodSubName'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 4),
                          Text(
                            widget.foodList[widget.index]['foodRate'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text('-'),
                          SizedBox(width: 4),
                          Text(
                            widget.foodList[widget.index]['mint'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        // color: Colors.red,
                        height: 130,
                        child: Text(
                          widget.foodList[widget.index]['foodDis'],
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 90,
                            width: 150,
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
                                SizedBox(height: 8),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    padding: EdgeInsets.only(right: 20),
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
                                SizedBox(height: 8),

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
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                "₹${widget.foodList[widget.index]['price'].toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
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

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xfffff0f3),
                    border: Border.all(color: Color(0xffef2a39)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (widget.foodList[widget.index]['qty'] > 1) {
                                widget.foodList[widget.index]['qty']--;
                                widget.foodList[widget.index]['totalPrice'] =
                                    widget.foodList[widget.index]['price'] *
                                        widget.foodList[widget.index]['qty'];
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            size: 16,
                            color: Colors.black87,
                          ),
                        ),

                        Text(
                          widget.foodList[widget.index]['qty'].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                            widget.foodList[widget.index]['qty']++;
                            widget.foodList[widget.index]['totalPrice'] =
                                widget.foodList[widget.index]['price'] *
                                    widget.foodList[widget.index]['qty'];
                          });

                          },
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // child: Center(
                  //   child: Text(
                  //     "₹${calculateTotalPrice()}",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                ),
                GestureDetector(
                  // onTap: () async {
                  //
                  //    bool alreadyAdded = false;
                  //    for (var item in cartList) {
                  //      if (item['foodName'] == widget.foodList[widget.index]['foodName'] &&
                  //          item['foodSubName'] == widget.foodList[widget.index]['foodSubName']) {
                  //        alreadyAdded = true;
                  //        break;
                  //      }
                  //    }
                  //
                  //    if (!alreadyAdded) {
                  //      cartList.add({
                  //        'foodName': widget.foodList[widget.index]['foodName'],
                  //        'foodSubName': widget.foodList[widget.index]['foodSubName'],
                  //        'foodImage': widget.foodList[widget.index]['foodImage'],
                  //        'price': widget.foodList[widget.index]['price'],
                  //        'qty': widget.foodList[widget.index]['qty'],
                  //        'totalPrice': widget.foodList[widget.index]['price']*widget.foodList[widget.index]['qty']
                  //      });
                  //      for (var item in cartList) {
                  //        print('Food: ${item['foodName']} ${item['foodSubName']}');
                  //        print('Price: ${item['price']}');
                  //        print('Qty: ${item['qty']}');
                  //        print('Total: ${item['totalPrice']}');
                  //        print('----------------------');
                  //      }
                  //
                  //    }
                  //    final updatedCart = await appRoute.push<List<Map<String, dynamic>>>('/FoodCartScreen');
                  //    if (updatedCart != null) {
                  //
                  //      for (var item in updatedCart) {
                  //        if (item['foodName'] == widget.foodList[widget.index]['foodName'] &&
                  //            item['foodSubName'] == widget.foodList[widget.index]['foodSubName']) {
                  //          setState(() {
                  //            widget.foodList[widget.index]['qty'] = item['qty'];
                  //            widget.foodList[widget.index]['totalPrice'] = item['totalPrice'];
                  //          });
                  //
                  //          break;
                  //        }
                  //      }
                  //
                  //
                  //    }
                  //
                  // },
                  onTap: () async {
                    bool found = false;

                    for (var item in cartList) {
                      if (item['foodName'] == widget.foodList[widget.index]['foodName'] &&
                          item['foodSubName'] == widget.foodList[widget.index]['foodSubName']) {
                        item['qty'] +=1;
                        item['totalPrice'] = item['price'] * item['qty'];
                        found = true;
                        break;
                      }
                    }

                    if (!found) {
                      cartList.add({
                        'foodName': widget.foodList[widget.index]['foodName'],
                        'foodSubName': widget.foodList[widget.index]['foodSubName'],
                        'foodImage': widget.foodList[widget.index]['foodImage'],
                        'price': widget.foodList[widget.index]['price'],
                        'qty': widget.foodList[widget.index]['qty'],
                        'totalPrice':
                        widget.foodList[widget.index]['price'] *
                            widget.foodList[widget.index]['qty'],
                      });
                    }

                    for (var item in cartList) {
                      AppLogger.info(message: item);
                    }
                    Navigator.pop(context);
                    final updatedCart =
                    await appRoute.push<List<Map<String, dynamic>>>('/FoodCartScreen');

                    if (updatedCart != null) {
                      for (var item in updatedCart) {
                        if (item['foodName'] ==
                            widget.foodList[widget.index]['foodName'] &&
                            item['foodSubName'] ==
                                widget.foodList[widget.index]['foodSubName']) {
                          setState(() {
                            widget.foodList[widget.index]['qty'] = item['qty'];
                            widget.foodList[widget.index]['totalPrice'] = item['totalPrice'];
                          });
                          break;
                        }
                      }
                    }
                  },

                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xffef2a39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add item ₹${ widget.foodList[widget.index]['totalPrice']}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: () async {
                //     // Find if item already in cart
                //     bool alreadyAdded = false;
                //     for (int i = 0; i < cartList.length; i++) {
                //       if (cartList[i]['foodName'] == widget.foodList[widget.index]['foodName'] &&
                //           cartList[i]['foodSubName'] == widget.foodList[widget.index]['foodSubName']) {
                //         alreadyAdded = true;
                //         break;
                //       }
                //     }
                //
                //     if (!alreadyAdded) {
                //       cartList.add({
                //         'foodName': widget.foodList[widget.index]['foodName'],
                //         'foodSubName': widget.foodList[widget.index]['foodSubName'],
                //         'foodImage': widget.foodList[widget.index]['foodImage'],
                //         'price': widget.foodList[widget.index]['price'],
                //         'qty': widget.foodList[widget.index]['qty'],
                //       });
                //     }
                //
                //     // Navigate to cart screen and wait for updated cart
                //     final updatedCart = await appRoute.push<List<Map<String, dynamic>>>('/FoodCartScreen');
                //
                //     if (updatedCart != null) {
                //       // Update the qty in bottom sheet
                //       final updatedItem = updatedCart.firstWhere(
                //             (e) => e['foodName'] == widget.foodList[widget.index]['foodName'],
                //         orElse: () => {'qty': widget.foodList[widget.index]['qty']},
                //       );
                //       setState(() {
                //         widget.foodList[widget.index]['qty'] = updatedItem['qty'];
                //       });
                //     }
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 180,
                //     decoration: BoxDecoration(
                //       color: Color(0xffef2a39),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Add item ₹${calculateTotalPrice()}",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // GestureDetector(
                //   onTap: () {
                //     print(
                //       "Printed Image ${widget.foodList[widget.index]['foodImage']}",
                //     );
                //     bool alreadyAdded = false;
                //     for (int i = 0; i < cartList.length; i++) {
                //       if (cartList[i]['foodName'] ==
                //               widget.foodList[widget.index]['foodName'] &&
                //       cartList[i]['foodSubName']==
                //           widget.foodList[widget.index]['foodSubName']) {
                //         alreadyAdded = true;
                //         break;
                //       }
                //     }
                //     if (!alreadyAdded) {
                //       cartList.add({
                //         'foodName': widget.foodList[widget.index]['foodName'],
                //         'foodSubName':
                //             widget.foodList[widget.index]['foodSubName'],
                //         'foodImage': widget.foodList[widget.index]['foodImage'],
                //         'price': widget.foodList[widget.index]['price'],
                //         'qty': widget.foodList[widget.index]['qty'],
                //       });
                //     }
                //     AppLogger.info(widget.foodList[widget.index]['qty']);
                //
                //     appRoute.push('/FoodCartScreen');
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 180,
                //     decoration: BoxDecoration(
                //       color: Color(0xffef2a39),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Add item ₹${calculateTotalPrice()}",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 104,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

void openFoodBottomSheet(
  BuildContext context,
  List<Map<String, dynamic>> foodList,
  int index,
) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => Food(foodList: foodList, index: index),
  );
}
