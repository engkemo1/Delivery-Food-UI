import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                elevation: 5,
                child: ListTile(
                  leading: Text(
                    "\$${1000 / 100}",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  title: Text("Burger"),
                  subtitle: Text("${DateTime.now()}"),
                  trailing: Text("in order",
                      style: TextStyle(
                        color: Colors.green,
                      )),
                ),
              )
            );
          }),
    );
  }
}
