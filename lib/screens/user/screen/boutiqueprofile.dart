

import 'package:appmobile/screens/user/screen/add_produitboutique.dart';
import 'package:appmobile/screens/user/screen/detailsprodboutique.dart';
import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:appmobile/screens/user/screen/updateboutique.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../module/boutiqueproduct.dart';
import '../../../module/client.dart';
import '../../../providers/provider.dart';
import '../../components/default.dart';


class profileboutique extends StatefulWidget {
  static const String routeName = "/profile";
   final Client boutique;

 const profileboutique({
    Key? key,
    required this.boutique,
  }) : super(key: key);

 @override
  State<profileboutique> createState() => _profileboutique();
}

class _profileboutique extends State<profileboutique> {

  List<Productboutique>? productsclients;
  
  final BoutiqueServices boutiqueServices = BoutiqueServices();

   @override
  void initState() {
    super.initState();
    fetchOrders();
  }
  void deleteboutique(Productboutique productsclient, int index) {
    boutiqueServices.deleteProduct(
      context: context,
      productsclient: productsclient,
      onSuccess: () {
        productsclients!.removeAt(index);
        setState(() {});
      },
    );
  }
  void fetchOrders() async {
    productsclients = await boutiqueServices.fetchAllProducts( context);
    setState(() {});
  }
  void update(List<Client> boutiques, int index) {
  Navigator.pushNamed(
    context,
    updateboutique.routeName,
    arguments: boutiques[index],
  );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
           
            Text(
              "Brands",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          
        ),
         actions: [
   IconButton(
  icon: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Icon(
      Icons.add_business_outlined,
      size: 24,
      color: Colors.black,
    ),
  ),
  onPressed: () {
    Navigator.pushNamed(context, addprodboutique.routeName);
   },
),
    
  ],
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
       ClipRRect(                    borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                        widget.boutique.images[0],
                         height: 150,
                      width: 150,
                      ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            // Handle edit image
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                 Column(
  children: [
 
    Text(
      widget.boutique.nameboutique,   
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
     Text(
      widget.boutique.numero,   
      style: TextStyle(
        fontSize: 13,
        color: Colors.black,
      ),
    ),
    Container(
  margin: EdgeInsets.symmetric(horizontal: 10),
  child: Text(
    widget.boutique.bio,   
    style: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
  ),
),

    ListTile(
      leading: Icon(Icons.category),
      title: Text(
      widget.boutique.category,   
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    ),
    ),
    ListTile(
      leading: Icon(Icons.email),
      title: Text(
        " ${Provider.of<UserProvider>(context).user.email}",
      ),
    
    ),
  
    DefaultButton(
      text:'Modify Profile',
           onTap: () {
 
    Navigator.pushNamed(context, addprodboutique.routeName);
     },   
  
    ),
  ],
),
                  SizedBox(height: 10),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Column(
      // Add your column widgets here
    ),
    SizedBox(height: 10),
  ],
),
Container(
 child: ListView.builder(
  shrinkWrap: true,
  itemCount: productsclients?.length ?? 0,
  itemBuilder: (context, index) {
    final productData = productsclients![index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  detailsproduct.routeName,
                  arguments: productData,
                );
              },
              child: ClipRRect (
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  productData.images[0],
                  height: 140,
                  width: 120,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    productData.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: LightColor.orange,
                    ),
                  ),
                  Text(
                    '${productData.price}TND',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () => deleteboutique(productData, index),
                icon: Icon(
                  Icons.remove_circle_outline_sharp,
                  color: Color.fromARGB(255, 139, 138, 138),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
),

)
       ] )
      )
     ]   )
      )
);
   } 
}
