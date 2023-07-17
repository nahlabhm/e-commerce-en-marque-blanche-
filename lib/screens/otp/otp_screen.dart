import 'package:appmobile/screens/otp/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';



class otpScreen extends StatelessWidget {
  static const String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      
      body: Body(),
    );
  }
}
