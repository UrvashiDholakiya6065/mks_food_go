import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final String image;
  final String name;
  const CommonContainer({super.key,required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      width: 88,
      decoration: BoxDecoration(
          color: Color(0xff3c2f2f),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Container(
            height: 64,
            width: 88,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Image.asset(image,height: 42,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),),
                Container(
                  height: 16,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(Icons.add,color: Colors.white,size: 12,),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
