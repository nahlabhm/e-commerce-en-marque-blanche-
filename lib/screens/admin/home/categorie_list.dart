import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../search/search.dart';
import 'categories.dart';

class CategoryDisplayScreen extends StatefulWidget {
    static const String routeName = "/category_list";

  const CategoryDisplayScreen({super.key});

  @override
  State<CategoryDisplayScreen> createState() => _CategoryDisplayScreenState();
}

class _CategoryDisplayScreenState extends State<CategoryDisplayScreen> {

   void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, Categories.routeName,
        arguments: category);
 }

   void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       appBar: AppBar(
      centerTitle: true,
      title: Column(
        children:[
          Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]
      ),  
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),  
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),

     body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kGreyColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_off_rounded,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                     onSubmitted: (String query) {
      navigateToSearchScreen(query); // Call the function when the text is submitted
    },
                    decoration: const InputDecoration(
                      hintText: 'Search products',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: GlobalVariables.categoryImages.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                
                 onTap: () => navigateToCategoryPage(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
               child: Container(
                  
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 170,
                  margin: const EdgeInsets.only(
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        
                        GlobalVariables.categoryImages[index]['image']!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              GlobalVariables.categoryImages[index]['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ) );
              },
            ),
          ),
        ],
      ),
    );
  }
}