


import 'package:appmobile/screens/admin/product/add_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../module/product.dart';
import '../../../size_config.dart';
import '../product/service_product/service-product.dart';




class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
 
  @override
  Widget build(BuildContext context) {

           
                return Column(
                  
          children: [
                   Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SectionTitle(
            title: "Products",
            press: () {},
          ),
        ),
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
          child:  IconButton(onPressed: (){
              Navigator.pushNamed(context, addproductScreen.routeName);

          },
             icon: SvgPicture.asset("assets/icons/Plus Icon.svg")
             )
        )
      ],
    );   
      
  }
}