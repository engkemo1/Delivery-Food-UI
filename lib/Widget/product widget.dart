import 'package:flutter/material.dart';
import 'package:kamal/models/products.dart';

import 'package:provider/provider.dart';

import 'CustomText.dart';


class ProductWidget extends StatelessWidget {
  final Products product;

  const ProductWidget({ required this.product}) ;

  @override
  Widget build(BuildContext context) {
   // final restaurantProvider = Provider.of<RestaurantProvider>(context);
    //final productProvider = Provider.of<ProductProvider>(context);


    return  Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]
        ),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
               // child: Image.network(product.image, fit: BoxFit.fill,),
                child:Image(image:AssetImage("image/hamburger.png"),)

              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          //text: product.name,
                          text: product.name,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1, 1),
                                    blurRadius: 4),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      children: <Widget>[
                        CustomText(text: "from: ", color: Colors.grey, weight: FontWeight.w300, size: 14,),
                        SizedBox(width: 10,),
                        GestureDetector(
                           /*
                            onTap: ()async{
                              await productProvider.loadProductsByRestaurant(
                                  restaurantId: product.restaurantId.toString());
                              await restaurantProvider.loadSingleRestaurant(retaurantId: product.restaurantId.toString());
                              changeScreen(context, RestaurantScreen(restaurantModel: restaurantProvider.restaurant,));
                            },
                            */

                           // child: CustomText(text: product.restaurant, color: Colors.yellow, weight: FontWeight.w300, size: 14,)),
                            child: CustomText(text:product.name, color: Colors.yellow, weight: FontWeight.w300, size: 14,)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomText(
                              text: "dsdas",
                              //product.rating.toString(),
                              color: Colors.grey,
                              size: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: CustomText(text: "\$${ 300/ 100}",weight: FontWeight.bold,),
                        //CustomText(text: "\$${ product.price / 100}",weight: FontWeight.bold,),
                      ),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}