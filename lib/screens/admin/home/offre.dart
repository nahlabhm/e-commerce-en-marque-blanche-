import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'category_brands.dart';


class BrandsPage extends StatelessWidget {
  static const String routeName = '/brands';

  void navigateToCategory(BuildContext context, String category) {
    Navigator.pushNamed(context, BrandsPagecategory.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SectionTitle(
            title: "Brands",
            press: () {},
          ),
        ),
 SizedBox(
  height: getProportionateScreenWidth(80),
  child: ListView.builder(
    itemCount: GlobalVariables.categoryImages.length,
    scrollDirection: Axis.horizontal,
    itemExtent: 100,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => navigateToCategory(
          context,
          GlobalVariables.categoryImages[index]['title']!,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
          child: SizedBox(
            width: getProportionateScreenWidth(90),
            height: getProportionateScreenWidth(150),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(
                    GlobalVariables.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10.0),
                        vertical: getProportionateScreenWidth(5),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Text(
                        GlobalVariables.categoryImages[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  ),
 )
      ]
);
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}