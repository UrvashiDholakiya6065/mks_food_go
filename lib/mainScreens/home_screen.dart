import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/route/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["All", "Combos", "Sliders", "Classic"];

  final List<Map<String, dynamic>> foodList = [
    {
      'foodName': 'Cheeseburger',
      'foodSubName': 'Wendy Burger',
      'foodRate': '4.9',
      'foodImage': 'assets/home/cheeseBurger.png',
      'mint': '26 mins',
      'foodDis':
          'The Cheeseburger Wendys Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, its topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.',
    },
    {
      'foodName': 'Hamburger',
      'foodSubName': 'Veggie Burger',
      'foodRate': '4.8',
      'foodImage': 'assets/home/hamBurger1.png',
      'mint': '14 mins',
      'foodDis':
          'Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ',
    },
    {
      'foodName': 'Hamburger',
      'foodSubName': 'Chicken Burger',
      'foodRate': '4.6',
      'foodImage': 'assets/home/hamBurger2.png',
      'mint': '42 mins',
      'foodDis':
          'Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!',
    },
    {
      'foodName': 'Hamburger',
      'foodSubName': 'Fried Chicken Burger',
      'foodRate': '4.5',
      'foodImage': 'assets/home/hamBurger3.png',
      'mint': '14 mins',
      'foodDis':
          'Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.',
    },
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Categories length${categories.length}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    child: Image.asset('assets/home/profile.png'),
                  ),
                ],
              ),
              Text("Order Your Favourite food!",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: Color(0xff6A6A6A)),),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 46,
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
                          Image.asset('assets/home/search.png',height: 20,),
                          SizedBox(width: 14,),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Color(0xff3C2F2F,),fontWeight: FontWeight.w500),
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
                    height: 50,
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
                height: 66,
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
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Color(0xffef2a39) : Color(0xffF3F4F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Text(
                            categories[index],
                            style: GoogleFonts.inter(
                              color: isSelected ? Colors.white : Color(0xff6A6A6A),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.2,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 1,
                    mainAxisExtent: 220,
                  ),
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          appRoute.push(
                            '/FoodDetailScreen',
                            extra: foodList[index],
                          );
                        },
                        child: Card(
                          shadowColor: Colors.black.withOpacity(0.34),
                          color: Colors.white,
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        foodList[index]['foodImage'],
                                      ),
                                      fit: BoxFit.contain,
                                      height: 78,
                                    ),
                                  ),
                                ),
                                Text(
                                  foodList[index]['foodName'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  foodList[index]['foodSubName'],
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    SizedBox(width: 4),
                                    Text(
                                      foodList[index]['foodRate'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 42),
                                    Icon(CupertinoIcons.heart),
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
