import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:foodgo/utils/bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../utils/list.dart';

class HomeScreen extends StatefulWidget {
  // final Map currentUser;


  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void searchFood(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredFoodList = foodList;
      } else {
        filteredFoodList = foodList.where((food) {
          final name = food['foodName'].toString().toLowerCase();
          final subName = food['foodSubName'].toString().toLowerCase();
          return name.contains(query.toLowerCase()) ||
              subName.contains(query.toLowerCase());
        }).toList();
      }
    });
  }
  List<Map<String, dynamic>> getFilteredFood(String category) {
    if (category == "All") {
      return foodList;
    } else if (category == "Combo") {
      return foodList.where((item) => item['type'] == 'Combo').toList();
    } else {
      return foodList;
    }
  }
  Box? userAuthBox=Hive.box('authUser');

  @override
  void initState() {
    super.initState();
    filteredFoodList = foodList;
  }

  int selectedIndex = 0;
  // bool isHeart = true;
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> filteredFoodList = [];

  @override
  Widget build(BuildContext context) {
    // final currentUserImage = widget.currentUser['image'];

    print("Categories length${categories.length}");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Food go", style: GoogleFonts.lobster(fontSize: 34)),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: GestureDetector(
                        onTap: (){
                          appRoute.push('/UserProfileScreen',extra:null,
                          );
                        },
                        // child: currentUserImage != null
                        //     ? CircleAvatar(
                        //   radius: 25,
                        //   backgroundImage: FileImage(File(currentUserImage)),
                        // )
                        //     : const
                   child:  CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.person),
                        ),),
                  ),
                ],
              ),
              Text(
                "Order Your Favourite food!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff6A6A6A),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/home/search.png', height: 20),
                          SizedBox(width: 14),
                          Expanded(
                            child: TextFormField(
                              controller: searchController,
                              onChanged: searchFood,
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Color(0xff3C2F2F),
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Container(
                    height: 42,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffef2a39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Image.asset(
                        'assets/home/settings-sliders.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14),

              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {

                    final isSelected = index == selectedIndex;

                    print(
                      "index: $index, selectedIndex: $selectedIndex, isSelected: $isSelected",
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            if (categories[index] == "All") {
                              filteredFoodList = foodList;
                            } else if (categories[index] == "Combos") {
                              filteredFoodList =
                                  foodList.where((e) => e['type'] == 'Combo').toList();
                            }

                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xffef2a39)
                                : Color(0xffF3F4F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            categories[index],
                            style: GoogleFonts.inter(
                              color: isSelected
                                  ? Colors.white
                                  : Color(0xff6A6A6A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: filteredFoodList.isEmpty
                    ? Center(child: Text("No items match your search"))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.65,
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          mainAxisExtent: 220,
                        ),
                        itemCount: filteredFoodList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                openFoodBottomSheet(context,filteredFoodList,index);
                                // appRoute.push(
                                //   '/FoodDetailScreen',
                                //   extra: filteredFoodList[index],
                                // );
                              },
                              child: Card(
                                shadowColor: Colors.black.withOpacity(0.34),
                                color: Colors.white,
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Center(
                                          child: Image(
                                            image: AssetImage(
                                              filteredFoodList[index]['foodImage'],
                                            ),
                                            fit: BoxFit.contain,
                                            height: 78,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        filteredFoodList[index]['foodName'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        filteredFoodList[index]['foodSubName'],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.star, color: Colors.amber,size: 14,),
                                              SizedBox(width: 4),
                                              Text(
                                                filteredFoodList[index]['foodRate'],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(width: 42),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                final items=filteredFoodList[index];
                                                items['isHeart'] = !items['isHeart'] ;
                                                if(items['isHeart']){
                                                  wishList.add(items);
                                                }else{
                                                  wishList.remove(filteredFoodList[index]);
                                                }
                                              });
                                            },
                                            child: Icon(
                                                filteredFoodList[index]['isHeart']
                                                    ? CupertinoIcons.heart_fill
                                                    : CupertinoIcons.heart,

                                                color: filteredFoodList[index]['isHeart']
                                                    ? Colors.red:Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
