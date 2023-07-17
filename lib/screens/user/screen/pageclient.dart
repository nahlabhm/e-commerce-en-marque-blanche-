
import 'package:appmobile/screens/user/screen/boutiqueprofile.dart';
import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:flutter/material.dart';

import '../../../module/client.dart';
import '../../admin/search/search.dart';
import '../../components/productsingle.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Client>? boutiques;
  
  final BoutiqueServices boutiqueServices = BoutiqueServices();

   @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    boutiques = await boutiqueServices.fetchAllboutique( context);
    setState(() {});
  }

   void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void deleteboutique(Client boutique, int index) {
    boutiqueServices.deleteboutique(
      context: context,
      boutique: boutique,
      onSuccess: () {
        boutiques!.removeAt(index);
        setState(() {});
      },
    );
  }
  @override
  Widget build(BuildContext context) {
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
                    hintText: 'Search Brands',
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
    body:GridView.builder(
                  itemCount: boutiques?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.73,
                  ),
                  itemBuilder: (context, index) {
                    final productData = boutiques![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          profileboutique.routeName,
                          arguments: productData,
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(97, 250, 249, 249),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
  child: Stack(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(50),
        ),
          child: SingleProduct(
                        image: boutiques![index].images[0],
                      ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: IconButton(
          onPressed: () => deleteboutique(productData, index),
          icon: Icon(
            Icons.bookmark_remove_outlined,
            color: Color.fromARGB(255, 139, 138, 138),
            size: 20,
          ),
        ),
      ),
      
  

    ],
  ),
 
                            
),
                            ),
                            
                          ),
           
                                      
                    ] )
                      );
                      }),
              
    
    
    );
  }
}