import 'package:appmobile/screens/admin/product/body.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';



class addproductScreen extends StatelessWidget {
  static const String routeName = "/add_product";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
         appBar: AppBar(
      centerTitle: true,
    
      title:Column(
        children:[
       Text(
     "Add Product  ",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
     
        ]
      ),  
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(0.2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),
    body:Body(),
    );
  }
}