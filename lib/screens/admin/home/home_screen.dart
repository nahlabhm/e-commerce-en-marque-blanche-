
import 'package:appmobile/screens/admin/home/body.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';





class homeAdminScreen extends StatefulWidget  {
  static const String routeName = "/home_admin";

  @override
  State<homeAdminScreen> createState() => _homeAdminScreen();
}
class _homeAdminScreen extends State<homeAdminScreen> {

  @override
  Widget build(BuildContext context) {
    
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
       body: Body(
        
       ),

    );
  }
}