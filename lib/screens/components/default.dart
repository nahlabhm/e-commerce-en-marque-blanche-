import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../size_config.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press, 
  this.onTap, 

  }) : super(key: key);
  final String? text;
  final Function? press;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(50),
      width:getProportionateScreenWidth(150),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          primary: Color.fromARGB(255, 252, 134, 203),
          backgroundColor:Color(0xffbf0772) ,
        ),
        onPressed: onTap as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
