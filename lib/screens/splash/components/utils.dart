import 'package:flutter/material.dart';

import '../../../constants.dart';





// building indicators
List<Widget> buildIndicators() {
  List<Widget> list = [];

  for (var i = 0; i < 4; i++) {
    list.add(
      i == 1 ? indicator(true) : indicator(false),
    );
  }

  return list;
}

Widget indicator(bool isActive) {
  return AnimatedContainer(
    margin: const EdgeInsets.symmetric(horizontal: 6.0),
    duration: const Duration(milliseconds: 150),
    height: 10.0,
    width: isActive ? 30.0 : 10.0,
    decoration: BoxDecoration(
      color: isActive ? kOrangeColor : Colors.grey,
      shape: !isActive ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: isActive ? BorderRadius.circular(20) : null,
    ),
  );
}