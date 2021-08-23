
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamal/helpers/Change%20Screen.dart';
import 'package:kamal/screens/Restaurent%20screen.dart';


class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListView.builder(itemCount:5,itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            changeScreen(context, RestaurantScreen());
          },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.blue,
                      blurRadius: 3,offset: Offset(1,1))
                ],
                color: Colors.white
            ),
            child: Column(
              children: [

                ClipRect(
                  child: Image.asset("image/hamburger.png",height: 150,width: 150,),
                )   ,
                SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Text("Humburger"),
                    Text("data")
                  ],)

              ],
            ),

          ),
        );
        
      }),
      
    );
  }
}
