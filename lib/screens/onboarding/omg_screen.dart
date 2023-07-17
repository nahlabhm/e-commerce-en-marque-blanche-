import 'package:appmobile/screens/onboarding/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class ombardingScreen extends StatelessWidget {
  static const String routeName = "/omboarding";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
