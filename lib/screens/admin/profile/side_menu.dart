
import 'package:line_icons/line_icons.dart';

import '../cart/cart.dart';
import '../helps/helps.dart';
import '../home/home_screen.dart';
import '../order/order.dart';
import '../order/order_admin.dart';
import '../product/add_product.dart';
import '../statistique/statistc.dart';

List sideMenuItems = [
      {
        "label": "Home",
        "selected": true,
        "icon": LineIcons.home,
        "page": homeAdminScreen()
      },
      {
        "label": "My Cart",
        "selected": false,
        "icon": LineIcons.shoppingCart,
      "page": MyCartPage()
      },
      {
        "label": "Add Product",
        "selected": false,
        "icon": LineIcons.heart,
      "page": addproductScreen()
      },
      {
        "label": "Orders",
        "selected": false,
        "icon": LineIcons.history,
       "page": OrdersScreen()
      },
            {
        "label": "analtyics",
        "selected": false,
        "icon": LineIcons.history,
       "page": AnalyticsScreen()
      },
         {
        "label": "Helps",
        "selected": false,
        "icon": LineIcons.helpingHands,
       "page": HelpsScreen()
      },
          {
        "label": "My Account",
        "selected": false,
        "icon": LineIcons.personEnteringBooth,
       "page": homeAdminScreen()
      },
    ];