

import 'package:appmobile/screens/admin/cart/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider.dart';
import '../../../size_config.dart';
import '../../components/default.dart';
import '../adress/adress.dart';
 



class MyCartPage extends StatefulWidget {
  const  MyCartPage({Key? key}) : super(key: key);
     static const String routeName = "/cart";


  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
     final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Scaffold( 
    appBar: AppBar(
  centerTitle: true,
  backgroundColor: Colors.white,
  elevation: 0,
  leading: IconButton(
    icon: Icon(
      Icons.arrow_back_ios_new,
      size: 24,
      color: Colors.black,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
     title:Column(
        children:[
       Text(
    'Your Cart',
    style: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
      Text(
     "${user.cart.length} items ",
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
      ),
        ]),
  actions: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(
        Icons.search,
        size: 24,
        color: Colors.black,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(
        Icons.notifications_none,
        size: 24,
        color: Colors.black,
      ),
    ),
  ],
),
      body: Body(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),

        ),
        height: 174,
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 250, 250, 250),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
              offset : Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA)
              ),
            ],
        ),
        child:SafeArea(
        child: Column(
             mainAxisSize:MainAxisSize.min ,
          children: [
            Row(
              children:[
            Container(
              padding: EdgeInsets.all(10),
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 242, 244),
                borderRadius: BorderRadius.circular(10),
              ),
            child:SvgPicture.asset("assets/icons/receipt.svg")

            ),
            Spacer(),
            Text("Add Voucher Code"),
            const SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios,size: 12, color: Color.fromARGB(255, 8, 8, 8),)
          ],
        ),

        SizedBox(height: getProportionateScreenHeight(20),),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
              text:"Total:\n",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),
              children: [
                TextSpan(
                text:"\$$sum ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                )
                )
              ]
            )),
            SizedBox(
              width: getProportionateScreenWidth(160),
              child: DefaultButton(
                text: "Check Out ",
                          onTap: () => navigateToAddress(sum),

              ),
            )
          ],
        )
          ]
      ),
      )
      )
    );
  }

}
