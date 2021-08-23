import 'package:flutter/material.dart';
import 'package:kamal/Widget/CustomText.dart';
import 'package:kamal/Widget/Loading.dart';
import 'package:kamal/helpers/Change%20Screen.dart';

import 'Cart.dart';

class Details extends StatefulWidget {
 // final ProductModel product;

  //const Details({@required this.product});


  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   // final user = Provider.of<UserProvider>(context);
    //final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              changeScreen(context, CartScreen());
            },
          ),

        ],
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){Navigator.pop(context);}),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
        //app.isLoading ? Loading() :
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            CircleAvatar(

              radius: 150,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("image/image.jpg",),

            //  backgroundImage: NetworkImage(),
            ),
            SizedBox(height: 15,),

            //CustomText(text: widget.product.name,size: 26,weight: FontWeight.bold),
            CustomText(text: "kemo",size: 26,weight: FontWeight.bold),

            //CustomText(text: "\$${widget.product.price / 100}",size: 20,weight: FontWeight.w400),
            CustomText(text: "\$${200 / 100}",size: 20,weight: FontWeight.w400),

            SizedBox(height: 10,),

            CustomText(text: "Description",size: 18,weight: FontWeight.w400),

            Padding(
              padding: const EdgeInsets.all(8.0),
             // child: Text(widget.product.description , textAlign: TextAlign.center, style: TextStyle(color: grey, fontWeight: FontWeight.w300),),
              child: Text("sddsadsadsasdadassd" , textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),),

            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove,size: 36,), onPressed: (){
                    if(quantity != 1){
                      setState(() {
                        quantity -= 1;
                      });
                    }
                  }),
                ),

                GestureDetector(
                 /*
                  onTap: ()async{
                  app.changeLoading();
                    print("All set loading");

                    bool value =  await user.addToCard(product: widget.product, quantity: quantity);
                    if(value){
                      print("Item added to cart");
                      _key.currentState!.showSnackBar(
                          SnackBar(content: Text("Added ro Cart!"))
                      );
                      user.reloadUserModel();
                      app.changeLoading();
                      return;
                    } else{
                      print("Item NOT added to cart");

                    }
                    print("lOADING SET TO FALSE");

                  },
                  */
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: //app.isLoading ? Loading() :
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28,12,28,12),
                      child: CustomText(text: "Add $quantity To Cart",color: Colors.white,size: 22,weight: FontWeight.w300,),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add,size: 36,color: Colors.red,), onPressed: (){
                    setState(() {
                      quantity += 1;
                    });
                  }),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}