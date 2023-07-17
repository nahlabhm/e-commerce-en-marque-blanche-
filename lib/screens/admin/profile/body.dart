

import 'package:appmobile/screens/admin/profile/report.dart';
import 'package:appmobile/screens/admin/profile/service_account/service_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider.dart';
import '../home/allboutique.dart';
import '../order/order_admin.dart';
import '../product/add_product.dart';
import '../statistique/statistc.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
static const keyLanguage='key-language';
  static const keydark='key-dark';
 bool _isDarkMode = false;
 
  get user => null;



@override
Widget build(BuildContext context) => Scaffold(
   appBar: AppBar( 
      centerTitle: true,
    
      title:Column(
        children:[
       Text(
       "Profile ",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
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
              border: Border.all(color: Colors.black.withOpacity(0.2))),
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
  
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            buildHeader(),
            SettingsGroup(
              title: 'GENERAL',
              children: <Widget>[
                const SizedBox(height: 8,),
                
                
                buildLougout(),
              ],
            ),
            const SizedBox(height: 32),
            SettingsGroup(
              title: 'FEEDBACK',
              children: <Widget>[
                const SizedBox(height: 8,),
                buildReportbug(),
                buildInfo(),
               buildStatic(),
               buildboutique(),
             
              ],
            ),
          ],
        ),
      ),
    );
   Widget buildLougout() {
  return Column(
    children: [
      Container(
        child: ListTile(
           onTap: () => AccountServices().logOut(context),
          minLeadingWidth: 20,
          leading: Icon(
            LineIcons.alternateSignOut,
            color: Colors.blueAccent,
            size: 28,
          ),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
          ),
        ),
      ),
    ],
  );
}

   Widget buildReportbug()
 {
  return 
  Column(
    children: [
      Container(
        child: ListTile(
                   
          minLeadingWidth: 20,
          leading: Icon(
            LineIcons.firstOrder,
            color: Colors.teal,
            size: 28,
          ),
          title: Text(
            "Orders ",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
          ),
     onTap: () {
  Navigator.pushNamed(context, OrdersScreen.routeName)   ; },
        ),
         

      ),
    ],
  );
}

   Widget buildboutique()
 {
  return 
  Column(
    children: [
      Container(
        child: ListTile(
                   
          minLeadingWidth: 20,
          leading: Icon(
            LineIcons.businessTime,
            color: Colors.teal,
            size: 28,
          ),
          title: Text(
            " Brands List ",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
          ),
     onTap: () {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => boutiqueall(),
      ),
    );    },
        ),
         

      ),
    ],
  );
}


Widget buildHeader() {
  return Container(
  padding: EdgeInsets.all(16),
  child: InkWell(
    onTap: () {
      Navigator.pushNamed(context, ReportBugPage.routeName);
    },
    child: Row(
      children: [
       
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Hello administrateur',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${Provider.of<UserProvider>(context).user.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
           Text(
              "${Provider.of<UserProvider>(context).user.email}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            Text(
              "${Provider.of<UserProvider>(context).user.address}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      
      ],
    ),
  ),
);

}


   Widget buildStatic()
 {
  return Column(
    children: [
      Container(
        child: ListTile(
          minLeadingWidth: 20,
          leading: Icon(
            LineIcons.thList,
            color: Colors.purple,
            size: 28,
          ),
          title: Text(
            "Analytics ",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
          ),
           onTap: () {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnalyticsScreen(),
      ),
    );    },
        ),
      ),
    ],
  );
}

   Widget buildSeendfeedback()
 {
  return Column(
    children: [
      Container(
        child: ListTile(
          minLeadingWidth: 20,
          leading: Icon(
            LineIcons.thumbsUp,
            color: Colors.purple,
            size: 28,
          ),
          title: Text(
            "Seend Fedback ",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
          ),
           onTap: () {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportBugPage(),
      ),
    );    },
        ),
      ),
    ],
  );
}



Widget buildInfo() {
  return  Column(
    children: [
      Container(
        child: ListTile(
          minLeadingWidth: 20,
    leading: Icon(
      LineIcons.addToShoppingCart,
      color: Colors.purple,
    ),
      title: Text(
            "Add Product ",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
          ),
    onTap: () {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => addproductScreen(),
      ),
    );    },
       ))] );
}
}