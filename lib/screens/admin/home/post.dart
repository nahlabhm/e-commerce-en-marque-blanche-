


import 'package:flutter/material.dart';

import '../../../module/product.dart';
import '../../components/loader.dart';
import '../cart/cart.dart';
import '../product/details_products.dart';
import '../product/service_product/service-product.dart';
import '../product/update_product.dart';
import '../search/search.dart';


class PostScreen extends StatefulWidget {
static const String routeName = "/post";
  @override
  State<PostScreen> createState() => _PostScreenState();
}
class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }
   void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }
void update(List<Product> products, int index) {
  Navigator.pushNamed(
    context,
    UpdateProductPage.routeName,
    arguments: products[index],
  );
}
 @override
Widget build(BuildContext context) {
     return products == null
        ? const Loader()
        : Scaffold(
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
                          Navigator.pushNamed(
                            context,
                            MyCartPage.routeName,
                          );
                        },
          ),
         
        ],
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 1,),
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 248, 248, 248),
                Color.fromARGB(255, 255, 255, 255),
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  onFieldSubmitted: navigateToSearchScreen,
                  decoration: InputDecoration(
                    hintText: 'Search products',
                    hintStyle: TextStyle(
                      color: Colors.black,
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
      ),
    ),
    body: 
    GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      itemCount: products!.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        final productData = products![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                          Navigator.pushNamed(
                            context,
                            detailsScreen.routeName,
                            arguments: productData,
                          );
                        },
    child: Stack(
  children: [

       Image.network(
        productData.images[0],
        width: 500,
        height: 350,
      ),

    Positioned(
      top: 5,
      right: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: Colors.deepOrangeAccent,
              size: 16,
            ),
            const SizedBox(width: 5),
            Text(
              '${productData.rating!.length} Reviews',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),
)
),
          
        
            SizedBox(height: 10),
            Text(
              productData.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontFamily: AutofillHints.creditCardName
              ),
            ),
             SizedBox(height: 10),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${productData.price}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffbf0772),
          ),
        ),
           Positioned(
  bottom: 10,
  right: 10,
  child: Row(
    children: [
      IconButton(
        onPressed: () => deleteProduct(productData, index),
        icon: Icon(
          Icons.remove_circle_outline,
          color: Color.fromARGB(255, 2, 2, 2),
          size: 20,
        ),
      ),
      IconButton(
        onPressed: () =>    Navigator.pushNamed(
    context,
    UpdateProductPage.routeName,
    arguments: products![index],
    ),
        icon: Icon(
          Icons.edit_outlined,
          color: Color.fromARGB(255, 2, 2, 2),
          size: 20,
        ),
      ),
    ],
  ),
),






           ] ),

          
          
        
          ],
        );
      },
    ),
  );
}
}