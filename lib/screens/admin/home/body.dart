import 'package:animate_do/animate_do.dart';
import 'package:appmobile/screens/admin/home/search.dart';
import 'package:appmobile/screens/admin/home/top_categorie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../module/product.dart';
import '../../../providers/provider.dart';
import '../../components/custom_slider.dart';
import '../product/deal.dart';
import '../product/service_product/service-product.dart';
import '../profile/profile_screen.dart';
import '../search/search.dart';
import 'ads_json.dart';
import 'header.dart';
import 'offre.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  String _selectedLang = 'en';

  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: PofileScreen(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Header(),
        preferredSize: Size.fromHeight(55),
      ),
      body: FadeInDown(
        duration: Duration(milliseconds: 500),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Hello Admin ${Provider.of<UserProvider>(context).user.name}".tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                "Let's get something".tr,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            
              SizedBox(height: 10),
              FadeInLeft(
                duration: Duration(milliseconds: 500),
                child: search(),
              ),
              SizedBox(height: 15),
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: CustomSlider(
                  items: adsJson,
                ),
              ),
              SizedBox(height: 10),
              FadeInLeft(
                duration: Duration(milliseconds: 500),
                child: TopCategories(),
              ),
              SizedBox(height: 10),
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: BrandsPage(),
              ),
              SizedBox(height: 10),
              FadeInLeft(
                duration: Duration(milliseconds: 500),
                child: DealOfDay(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Transl extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}

const Map<String, String> en = {
  'Hello': 'Hello',
  'Let\'s get something': 'Let\'s get something',
};
const Map<String,String> ar ={
  'hello ':'مرحبًا',
  'Let s get something': 'دعنا نحصل على شيء',
};