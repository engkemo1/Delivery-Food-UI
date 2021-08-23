
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top :20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          decoration: InputDecoration(

            contentPadding: EdgeInsets.only(left: 10,top: 10),
                hintText: "Search my food",
            border: InputBorder.none,
            suffixIcon: Material(

              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              child: Icon(Icons.search,color: Colors.black,),
            )

          ),
        ),
      ),
    );
  }
}
