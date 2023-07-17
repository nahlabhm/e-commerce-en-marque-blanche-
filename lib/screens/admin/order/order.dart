import 'package:flutter/material.dart';

import '../../../module/order.dart';
import '../../components/loader.dart';
import '../../components/productsingle.dart';
import '../profile/service_account/service_account.dart';
class Orders extends StatefulWidget {
  static const String routeName = "/orders";

  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchAllorders(context);
    setState(() {});
  }
 @override
Widget build(BuildContext context) {
     return orders == null
        ? const Loader()
        : Scaffold(
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
        
        actions: [
       
         
        ],
      
      ),
    ),
    body: 
    GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

itemCount: orders != null ? orders!.length : 0,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        final productData = orders![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Expanded(
              child: GestureDetector(
              
    child: Stack(
  children: [
 SingleProduct(
                        image: orders![index].products[0].images[0],
                      ),

   
  ],
),
)
),
          
        

          
          
        
          ],
        );
      },
    ),
  );
}
}