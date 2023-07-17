import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
    this.image, 
  }) : super(key: key);
final String?  image;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
        borderRadius: BorderRadius.circular(20 ),
      child:
        Image.asset(
          image!,
         height: 230,
         width: 360,
        
       
        ),
        )
      ]
    );
    
  }
}