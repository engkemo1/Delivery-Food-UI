



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamal/catee.dart';

import '../models/Models.dart';
import 'FoddCARD.dart';

class CategoryWidget extends StatelessWidget {
  List<CategorModel> cat=Categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child:
       ListView.builder(
         scrollDirection: Axis.horizontal,
         itemCount: cat.length,
         itemBuilder: (context,index){
           return FoodCard(name: cat[index].name, image: cat[index].image, numofitem: cat[index].numOfcategory.toInt());
         },




        )
    );
  }
}
