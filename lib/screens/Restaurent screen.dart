import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamal/Widget/CustomText.dart';
import 'package:kamal/Widget/Loading.dart';
import 'package:kamal/Widget/product%20widget.dart';
import 'package:kamal/Widget/small%20Button.dart';
import 'package:kamal/catee.dart';
import 'package:kamal/helpers/Change%20Screen.dart';
import 'package:kamal/models/products.dart';
import 'package:transparent_image/transparent_image.dart';

import 'Details.dart';

class RestaurantScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: <Widget>[

              Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),

                  // restaurant image
                  ClipRRect(

                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),



                     child: Image.asset("image/girl.jpg",height: 250,width: double.infinity,fit: BoxFit.cover,)



                   /* child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: "https://images.app.goo.gl/n8qGgHckY6Uy4wHi6",
                      height: 160,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                    */
                  ),
                  // fading black
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        )),
                  ),

                  //restaurant name
                  Positioned.fill(
                      bottom: 60,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomText(
                            text: "Restaurent",
                            color: Colors.white,
                            size: 26,
                            weight: FontWeight.w300,))),

                  // average price
                  Positioned.fill(
                      bottom: 40,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomText(
                            text: "Average Price: \$" +
                               "12",
                            color: Colors.white,
                            size: 18,
                            weight: FontWeight.w300,))),

                  // rating widget
                  Positioned.fill(
                      bottom: 2,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.0"),
                              ],
                            ),
                          ),
                        ),
                      )),

                  // close button
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.2)
                                ),
                                child: Icon(Icons.close, color: Colors.white,)),
                          ),
                        ),)),

                  //like button
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {},
                            child: SmallButton(Icons.favorite),
                          ),
                        ),)),


                ],
              ),
              SizedBox(
                height: 10,
              ),


//              open & book section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomText(
                    text: "Open",
                    color: Colors.green,
                    weight: FontWeight.w400,
                    size: 18,),
                  Container(
                      child: FlatButton.icon(onPressed: () {},
                          icon: Icon(Icons.restaurant_menu),
                          label: CustomText(text: "Book Now")))
                ],
              ),

              SizedBox(height: 10,),

              // products

              Column(
                children:product
                    .map((item) =>
                    GestureDetector(
                      onTap: () {
                        changeScreen(context, Details());
                      },
                      child: ProductWidget(
                        product: item,
                      ),
                    ))
                    .toList(),
              )


            ],

          )),
    );
  }
}