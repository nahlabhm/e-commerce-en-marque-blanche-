
import 'package:appmobile/screens/user/screen/boutiqueprofile.dart';
import 'package:flutter/material.dart';

import '../../../module/client.dart';
import '../product/service_product/service-product.dart';

class boutiqueall extends StatefulWidget  {
    static const String routeName = '/category-deals';

  const boutiqueall({
    Key? key,
  
  }) : super(key: key);

  @override
  State<boutiqueall> createState() => _boutiqueall();
}

class _boutiqueall extends State<boutiqueall> {
 List<Client>? boutiques;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryboutique();
  }
  void deleteboutique(Client boutique, int index) {
    adminServices.deleteboutique(
      context: context,
      boutique: boutique,
      onSuccess: () {
        boutiques!.removeAt(index);
        setState(() {});
      },
    );
  }
  fetchCategoryboutique() async {
    boutiques = await adminServices.fetchAllboutique(
      context    );
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
   
          centerTitle: true,
    
      title:Column(
        children:[
       Text(
           "All Brands",
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
      ),
  body: ListView.builder(
  padding: const EdgeInsets.all(10),
  itemCount: boutiques!.length,
  
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
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                productData.images[0],
                fit: BoxFit.cover,
                height: 140,
                width: 120,
              ),
            ),
            
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    productData.nameboutique,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    productData.category,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    productData.address,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    productData.bio,
                    style: TextStyle(
                     color:Colors.black,
                    ),
                  ),
                  
       Positioned(
       
        child: IconButton(
          onPressed: () => deleteboutique(productData, index),
          icon: Icon(
            Icons.remove_circle,
            color: Color.fromARGB(255, 139, 138, 138),
            size: 20,
          ),
        ),
      ),
                ],
              ),
            ),
          ],
        ),
        
      ),
      
    );
  },
  )
);
  }
} 