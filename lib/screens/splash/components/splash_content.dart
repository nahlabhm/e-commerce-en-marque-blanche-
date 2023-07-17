import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  

  const SplashContent({
    Key? key,
    this.text,
    this.descripton,
    this.image, 
  }) : super(key: key);
  final String? text,descripton,image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image!,
         height: 270,
        ),
      const SizedBox(
            height: 20,
          ),
       
        Text(
          text!,
          textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

        ), 
            Text(
            descripton!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
      

      ],
    );
  }
}
