import 'package:flutter/material.dart';

import '../utils/list.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    print("Wish List Lenght :${wishList.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
      ),
      body: wishList.isEmpty?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 60, color: Colors.grey),
            SizedBox(height: 12),
            Text(
              "Your wishlist is empty",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "Tap the ❤️ to save your favourite food",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ):ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(wishList[index]['foodImage']),
            title: Text(wishList[index]['foodName']),
            subtitle: Text(wishList[index]['foodSubName']),
            trailing: Text("⭐ ${wishList[index]['foodRate']}"),
          );
        },
      ),
    );
  }
}
