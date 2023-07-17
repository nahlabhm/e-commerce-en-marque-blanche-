
import 'package:appmobile/screens/admin/product/details_products.dart';
import 'package:flutter/material.dart';

import '../../../../module/product.dart';
import '../../components/stars.dart';


class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
  double totalRating = 0;
  for (int i = 0; i < product.rating!.length; i++) {
    totalRating += product.rating![i].rating;
  }
  double avgRating = 0;
  if (totalRating != 0) {
    avgRating = totalRating /product.rating!.length;
  }
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.images[0],
            fit: BoxFit.cover,
            height: 140,
            width: 120,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Stars(rating: avgRating),
                  const SizedBox(width: 8),
                  Text(
                    '${product.rating!.length} Reviews',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                '${product.price} TND', 

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Eligible for FREE Shipping',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'In Stock',
                style: TextStyle(
                  color: Color.fromARGB(255, 143, 20, 92),
                ),
              ),
                ElevatedButton(
        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            detailsScreen.routeName,
                           
                          );
                        },
          child: Text('Buy Now'),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffbf0772),
            onPrimary: Colors.white,
          ),
        ),
            ],
          ),
        ),
      ],
    ),
  );
}

}