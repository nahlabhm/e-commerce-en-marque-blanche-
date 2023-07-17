
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../providers/provider.dart';
import '../admin/cart/cart.dart';
import '../admin/home/home_screen.dart';
import '../admin/home/post.dart';
import '../admin/order/order.dart';
import '../admin/profile/profile_screen.dart';
import '../admin/profile/profileuser.dart';
import '../admin/scan/scan.dart';
import '../user/screen/pagehome.dart';
 
    class barScreen extends StatefulWidget {
  static const String routeName = "/nav_bar";
  const barScreen({Key? key}) : super(key: key);

  @override
  State<barScreen> createState() => _barScreen();
}

class _barScreen extends State<barScreen> {
  int _bottomNavIndex = 0;
  int _page = 0;

  List<IconData> iconList = [
    Icons.home,
    Icons.post_add,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<String> titleList = [
    'Home',
    'Posts',
    'Cart',
    'Profile',
  ];

  List<Widget> pages = [
    homeAdminScreen(),
    PostScreen(),
     MyCartPage(),

    PofileScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen =
        context.select((UserProvider userProvider) => userProvider.user.cart.length);

return Scaffold(
  body: pages[_page],
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        PageTransition(
            child: scanScreen(), type: PageTransitionType.bottomToTop),
      );
    },
    child: Image.asset(
      'assets/images/code-scan-two.png',
      height: 30.0,
    ),
    backgroundColor: const Color(0xffbf0772),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: AnimatedBottomNavigationBar.builder(
    itemCount: iconList.length,
    tabBuilder: (int index, bool isActive) {
      final color = isActive ? Color(0xffbf0772) : Colors.black;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconList[index], color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            titleList[index],
            style: TextStyle(color: color),
          ),
          if (index == 2)
  SizedBox(
    height: 5, // adjust the height to fit the badge
    width: 40,
    child: badges.Badge(
          position: BadgePosition.topEnd(top: -100, end: -10),
      badgeContent: Text(
        userCartLen.toString(),
        style: TextStyle(color: Colors.black),
      ),
      badgeStyle: BadgeStyle(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 60),
                    badgeColor: Color.fromARGB(255, 250, 225, 225)

      ),
          child: Icon(Icons.shopping_cart_outlined,),
    ),
  ),

        ],
      );
    },
    activeIndex: _bottomNavIndex,
    splashColor: Color(0xffbf0772),
    notchSmoothness: NotchSmoothness.softEdge,
    gapLocation: GapLocation.center,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    onTap: (index) => setState(() {
      _bottomNavIndex = index;
      _page = index;
    }),
  ),
);
  
  }
}


  class baruserScreen extends StatefulWidget {
  static const String routeName = "/navbaruser";
  const baruserScreen({Key? key}) : super(key: key);

  @override
  State<baruserScreen> createState() => _baruserScreen();
}

class _baruserScreen extends State<baruserScreen> {
  int _bottomNavIndex = 0;
  int _page = 0;

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<String> titleList = [
    'Home',
    'Order',
    'Cart',
    'Profile',
  ];

  List<Widget> pages = [
    HomePage(),
    Orders(),
    MyCartPage(),
    Bodyuser(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen =
        context.select((UserProvider userProvider) => userProvider.user.cart.length);

return Scaffold(
  body: pages[_page],
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        PageTransition(
            child: scanScreen(), type: PageTransitionType.bottomToTop),
      );
    },
    child: Image.asset(
      'assets/images/code-scan-two.png',
      height: 30.0,
    ),
    backgroundColor: const Color(0xffbf0772),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: AnimatedBottomNavigationBar.builder(
    itemCount: iconList.length,
    tabBuilder: (int index, bool isActive) {
      final color = isActive ? Color(0xffbf0772) : Colors.black;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconList[index], color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            titleList[index],
            style: TextStyle(color: color),
          ),
          if (index == 2)
  SizedBox(
    height: 5, // adjust the height to fit the badge
    width: 40,
    child: badges.Badge(
          position: BadgePosition.topEnd(top: -100, end: -10),
      badgeContent: Text(
        userCartLen.toString(),
        style: TextStyle(color: Colors.black),
      ),
      badgeStyle: BadgeStyle(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 60),
                    badgeColor: Color.fromARGB(255, 250, 225, 225)

      ),
          child: Icon(Icons.shopping_cart_outlined,),
    ),
  ),

        ],
      );
    },
    activeIndex: _bottomNavIndex,
    splashColor: Color(0xffbf0772),
    notchSmoothness: NotchSmoothness.softEdge,
    gapLocation: GapLocation.center,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    onTap: (index) => setState(() {
      _bottomNavIndex = index;
      _page = index;
    }),
  ),
);
  
  }
}




  class barclientScreen extends StatefulWidget {
  static const String routeName = "/barclientScreen";
  const barclientScreen({Key? key}) : super(key: key);

  @override
  State<barclientScreen> createState() => _barclientScreen();
}

class _barclientScreen extends State<barclientScreen> {
  int _bottomNavIndex = 0;
  int _page = 0;

  List<IconData> iconList = [
    Icons.home,
    Icons.branding_watermark,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<String> titleList = [
    'Home',
    'Boutique',
    'Cart',
    'Profile',
  ];

  List<Widget> pages = [
 
    MyCartPage(),
    PofileScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen =
        context.select((UserProvider userProvider) => userProvider.user.cart.length);

return Scaffold(
  body: pages[_page],
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        PageTransition(
            child: scanScreen(), type: PageTransitionType.bottomToTop),
      );
    },
    child: Image.asset(
      'assets/images/code-scan-two.png',
      height: 30.0,
    ),
    backgroundColor: const Color(0xffbf0772),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: AnimatedBottomNavigationBar.builder(
    itemCount: iconList.length,
    tabBuilder: (int index, bool isActive) {
      final color = isActive ? Color(0xffbf0772) : Colors.black;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconList[index], color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            titleList[index],
            style: TextStyle(color: color),
          ),
          if (index == 2)
  SizedBox(
    height: 5, // adjust the height to fit the badge
    width: 40,
    child: badges.Badge(
          position: BadgePosition.topEnd(top: -100, end: -10),
      badgeContent: Text(
        userCartLen.toString(),
        style: TextStyle(color: Colors.black),
      ),
      badgeStyle: BadgeStyle(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 60),
                    badgeColor: Color.fromARGB(255, 250, 225, 225)

      ),
          child: Icon(Icons.shopping_cart_outlined,),
    ),
  ),

        ],
      );
    },
    activeIndex: _bottomNavIndex,
    splashColor: Color(0xffbf0772),
    notchSmoothness: NotchSmoothness.softEdge,
    gapLocation: GapLocation.center,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    onTap: (index) => setState(() {
      _bottomNavIndex = index;
      _page = index;
    }),
  ),
);
  
  }
}