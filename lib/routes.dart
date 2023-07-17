
import 'package:appmobile/screens/admin/adress/adress.dart';
import 'package:appmobile/screens/admin/cart/cart.dart';
import 'package:appmobile/screens/admin/helps/helps.dart';
import 'package:appmobile/screens/admin/home/categorie_list.dart';
import 'package:appmobile/screens/admin/home/categories.dart';
import 'package:appmobile/screens/admin/home/category_brands.dart';
import 'package:appmobile/screens/admin/home/home_screen.dart';
import 'package:appmobile/screens/admin/home/post.dart';
import 'package:appmobile/screens/admin/order/order_admin.dart';
import 'package:appmobile/screens/admin/order/order_details.dart';
import 'package:appmobile/screens/admin/product/add_product.dart';
import 'package:appmobile/screens/admin/product/comments.dart';
import 'package:appmobile/screens/admin/product/details_products.dart';
import 'package:appmobile/screens/admin/product/update_product.dart';
import 'package:appmobile/screens/admin/profile/profile_screen.dart';
import 'package:appmobile/screens/admin/profile/report.dart';
import 'package:appmobile/screens/admin/scan/scan.dart';
import 'package:appmobile/screens/admin/search/search.dart';
import 'package:appmobile/screens/admin/statistique/statistc.dart';
import 'package:appmobile/screens/forgot_password/password_screen.dart';
import 'package:appmobile/screens/nav_bar/nav_bar.dart';
import 'package:appmobile/screens/otp/otp_screen.dart';
import 'package:appmobile/screens/signin/signin_screen.dart';
import 'package:appmobile/screens/signup/signup_screen.dart';
import 'package:appmobile/screens/splash/splash_screen.dart';
import 'package:appmobile/screens/user/addboutique.dart';
import 'package:appmobile/screens/user/screen/add_produitboutique.dart';
import 'package:appmobile/screens/user/screen/boutiqueprofile.dart';
import 'package:appmobile/screens/user/screen/detailsprodboutique.dart';
import 'package:appmobile/screens/user/screen/pagehome.dart';
import 'package:appmobile/screens/user/screen/updateboutique.dart';
import 'package:flutter/material.dart';

import 'module/boutiqueproduct.dart';
import 'module/client.dart';
import 'module/order.dart';
import 'module/product.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
   switch (routeSettings.name) {
    case SigninScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  SigninScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  SplashScreen(),
      );
    case PasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  PasswordScreen(),
      );
        case addproductclientScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  addproductclientScreen(),
      );
      
   
       case HelpsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  HelpsScreen(),
      );

         case addprodboutique.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  addprodboutique(),
      );

      
    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  SignupScreen(),
      );
     
      case barclientScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  barclientScreen(),
      );
       case PostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  PostScreen(),
      );

        case OrdersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  OrdersScreen(),
      );
           case profileboutique.routeName:
                 var boutique = routeSettings.arguments as Client;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  profileboutique(boutique: boutique,),
      );
        case updateboutique.routeName:
                 var boutique = routeSettings.arguments as Client;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  updateboutique(boutique: boutique,),
      );
  case detailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => detailsScreen(
          product: product,
        ),
      );
     
        case detailsproduct.routeName:
      var productsclient = routeSettings.arguments as Productboutique;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => detailsproduct(
          productsclient: productsclient,
        ),
      );
    case PofileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  PofileScreen(),
      );
         case comments.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  comments(),
      );
   case scanScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  scanScreen(),
      );
       case barScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  barScreen(),
      );
         case ReportBugPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  ReportBugPage(),
      );
         case baruserScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  baruserScreen(),
      );
       case CategoryDisplayScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  CategoryDisplayScreen(),
      );
       case MyCartPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  MyCartPage(),
      );
    case addproductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  addproductScreen(),
      );
      case UpdateProductPage.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UpdateProductPage(
          product: product,
        ),
      );
     
       case otpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  otpScreen(),
      );
       case homeAdminScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  homeAdminScreen(),
      );
        case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  HomePage(),
      );
         case AnalyticsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  AnalyticsScreen(),
      );
    case Categories.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Categories(
          category: category,
        ),
      );
      case BrandsPagecategory.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BrandsPagecategory(
          category: category,
        ),
      );
        case AddressScreen.routeName:
      var totalAmount= routeSettings.arguments as String;;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  AddressScreen(
          totalAmount: totalAmount ,
        ),
      );
   case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
       case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
       default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
  
 