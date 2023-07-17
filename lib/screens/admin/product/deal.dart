
import 'package:appmobile/screens/admin/product/details_products.dart';
import 'package:appmobile/screens/admin/product/service_category/service_category.dart';
import 'package:appmobile/screens/admin/product/service_details/details.dart';
import 'package:flutter/material.dart';

import '../../../module/product.dart';
import '../../../size_config.dart';
import '../../components/stars.dart';
import '../home/post.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      detailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      
      return const SizedBox();
    }

    double totalRating = 0;
    for (int i = 0; i < product!.rating!.length; i++) {
      totalRating += product!.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product!.rating!.length;
    }

    return GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: SectionTitle(
              title: "Deal Of The Day",
              press: () {},
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product!.images[0],
              height: 266,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product!.name}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${product!.price.toStringAsFixed(2)}TND',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 54, 53, 53),
                  ),
                ),
                Row(
                  children: [
                    Stars(rating: avgRating),
                    const SizedBox(width: 8),
                    Text(
                      '${product!.rating!.length} Reviews',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images
                  .map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Image.network(
                          e,
                          fit: BoxFit.fitWidth,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
               vertical: 5,
),
child: GestureDetector(
onTap: () {
Navigator.pushNamed(
context,
detailsScreen.routeName,
);
},
child: Row(
children: [
Text(
"See More Detail",
style: TextStyle(
color: Color(0xffbf0772),
fontWeight: FontWeight.w600,
),
),
const SizedBox(width: 5),
Icon(
Icons.arrow_forward_ios,
size: 12,
color: Color(0xffbf0772),
),
],
),
),
),
],
),
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
onTap: () {
Navigator.pushNamed(
context,
PostScreen.routeName,
);
},
child: Text(
"See More",
style: TextStyle(
color: Color.fromARGB(255, 150, 150, 150),
),
),
),
],
);
}
}