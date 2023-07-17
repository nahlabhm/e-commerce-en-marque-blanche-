

import 'package:appmobile/screens/admin/profile/body.dart';
import 'package:flutter/material.dart';

class PofileScreen extends StatefulWidget {
   static const String routeName = "/profile";
const PofileScreen({ Key? key}) : super(key: key);
  

   @override
  State<PofileScreen> createState() => _PofileScreen();
}

class _PofileScreen extends State<PofileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(), 
    );
  }
}