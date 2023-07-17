import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider.dart';
import '../../../size_config.dart';
import '../../admin/home/ads_json.dart';
import '../../admin/home/offre.dart';
import '../../admin/home/search.dart';
import '../../admin/home/top_categorie.dart';
import '../../admin/product/deal.dart';
import '../../admin/search/search.dart';
import '../../components/custom_slider.dart';

class HomePage extends StatefulWidget {
    static const String routeName = "/home_user";

  const HomePage({Key? key,   
}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 



  var scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;


   void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
            final user = Provider.of<UserProvider>(context).user;

    return AppBar(
      
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
           scaffoldKey.currentState?.openDrawer();
        },
      ),
       title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SvgPicture.asset("assets/icons/Location.svg"),
             SizedBox(width: getProportionateScreenWidth(20),),
             Text(
'${user.address} ',          
  style:Theme.of(context).textTheme.subtitle2,
             ),
           ]),
     
      actions: [
       
       
        SizedBox(
          width: 20,
        )
      ],
       elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  Widget getBody() {
       final user = Provider.of<UserProvider>(context).user;

    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
                'Hello ${user.name} ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            "Let's get something",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
             search(),

          SizedBox(
            height: 20,
          ),
          CustomSlider(
            items: adsJson,
          ),
          SizedBox(
            height: 10,
          ),
          getCategorySection(),
          SizedBox(
            height: 10,
          ),
      
       FadeInRight(
                duration: Duration(milliseconds: 500),
                child: BrandsPage(),
              ),
           FadeInLeft(
                duration: Duration(milliseconds: 500),
                child: DealOfDay(),
              ),
        ],
      ),
    );
  }

  Widget getCategorySection() {
    var size = MediaQuery.of(context).size;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
     
              FadeInLeft(
                duration: Duration(milliseconds: 500),
                child: TopCategories(),
              ),
      ]);
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
return Padding(
padding: EdgeInsets.symmetric(
horizontal: getProportionateScreenWidth(20),
),
child: Row(
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
onTap: (){},
child: Text(
"See More",
style: TextStyle(color: Color.fromARGB(255, 150, 150, 150)),
),
),
],
),
);
}
}