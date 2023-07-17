
import 'package:flutter/material.dart';


import '../../../constants.dart';
import '../../../size_config.dart';
import '../../components/size_dart.dart';
import 'categorie_list.dart';
import 'categories.dart';
import 'home_json.dart';


class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

 void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, Categories.routeName,
        arguments: category);
 }
   @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
     Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SectionTitle(
            title: " ",
            press: () {},
          ),
        ),
    SizedBox(
      
      height: 80,
      
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 90,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategoryPage(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      )]);
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
        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CategoryDisplayScreen.routeName,
                          );
                        },          child: Text(
            "See More",
            style: TextStyle(color: Color.fromARGB(255, 150, 150, 150)),
          ),
        ),
      ],
    );
  }
}