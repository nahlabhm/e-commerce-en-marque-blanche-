
import 'package:flutter/material.dart';

import '../../../../module/product.dart';
import '../../../module/client.dart';
import '../../components/stars.dart';


class Searchedboutique extends StatelessWidget {
  final Client boutique;
  const Searchedboutique({
    Key? key,
    required this.boutique,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
 
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            boutique.images[0],
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
                boutique.nameboutique,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
            
              const SizedBox(height: 5),
              Text(
                '${boutique.category}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
               '${boutique.bio}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                 '${boutique.numero}',
                style: TextStyle(
                  color: Color.fromARGB(255, 143, 20, 92),
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