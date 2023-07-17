import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


import '../../../providers/provider.dart';
import '../../../size_config.dart';
import 'item_cart.dart';


class Body extends StatefulWidget {
 @override
 _BodyState createState()=> _BodyState();
 }

class _BodyState extends State<Body>{
  @override
  Widget build(BuildContext context) {
        final user = context.watch<UserProvider>().user;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10)),
           child: ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(
                  index: index,
                );
              },
           )
    );
    
  }
}