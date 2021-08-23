



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {

final String name;
final String image;
final int  numofitem;

  const FoodCard({Key? key, required this.name, required this.image, required this.numofitem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          children: [
            Image(
              image: AssetImage(image),height: 65,width: 65,

            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                Text(numofitem.toString()+"kinds"),

              ],
            )

          ],
        ),
      ),
    );
  }
}
