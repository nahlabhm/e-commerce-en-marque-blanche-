
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider.dart';


class Header extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}



class _BodyState extends State<Header> {
   var scaffoldKey = GlobalKey<ScaffoldState>();

String _selectedLang ='en';

  @override
  Widget build(BuildContext context) {
        final user = Provider.of<UserProvider>(context).user;
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      
      children: [
        Image.asset(
          "assets/images/Neutral Minimalist Typography Vintage Monogram Logo (1).png",
          height: 90,
        ),
        // Add additional widgets or text as needed
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/Notification.svg"),
      ),

    ],
  ),
);


  }

}
