

import 'package:appmobile/screens/admin/product/details_products.dart';
import 'package:appmobile/screens/admin/search/searchboutique.dart';
import 'package:appmobile/screens/admin/search/searched.dart';
import 'package:appmobile/screens/admin/search/service/service_search.dart';
import 'package:appmobile/screens/user/screen/boutiqueprofile.dart';
import 'package:flutter/material.dart';

import '../../../module/client.dart';
import '../../../module/product.dart';
import '../../../size_config.dart';
import '../../components/loader.dart';


class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
   List<Product>? products;
    List<Client>? boutiques;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
    fetchSearchedboutique();
  }
fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }
fetchSearchedboutique() async {
    boutiques = await searchServices.fetchSearchedboutique(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
    
   appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  leading: IconButton(
    icon: Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Colors.black,
      size: 24,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  actions: [
    IconButton(
      icon: Icon(
        Icons.shopping_cart_rounded,
        color: Colors.black,
        size: 24,
      ),
      onPressed: () {
        // TODO: Add shopping cart functionality
      },
    ),
    IconButton(
      icon: Icon(
        Icons.favorite_border_rounded,
        color: Colors.black,
        size: 24,
      ),
      onPressed: () {
        // TODO: Add favorite functionality
      },
    ),
  ],
  title: Container(
    margin: EdgeInsets.symmetric(horizontal: 1, ),
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 22),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
                    Color.fromARGB(255, 143, 20, 92),

          Color.fromARGB(255, 255, 255, 255),
        ],
      ),
    ),
    child: Row(
      children: [
        Icon(
          Icons.search_rounded,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            onFieldSubmitted: navigateToSearchScreen,
            decoration: InputDecoration(
              hintText: 'Search products',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  ),
)

      ),
      body: products == null
          ? const Loader()
          : Column(
              children: [
                 Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                        Navigator.pushNamed(context, detailsScreen.routeName,arguments:products![index] );
                        },
                        child: SearchedProduct(
                          product: products![index],
                        ),
                      );
   } ),
                      ),
                       Expanded(
                  child: ListView.builder(
                    itemCount: boutiques!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                        Navigator.pushNamed(context, profileboutique.routeName,arguments:boutiques![index] );
                        },
                        child: Searchedboutique(
                          boutique: boutiques![index],
                        ),
                      );
   } ),
  
                  
  
                      )
                  
                  
              ],
            ),
    );
  }
}
  