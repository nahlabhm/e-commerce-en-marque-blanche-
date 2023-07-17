import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../components/loader.dart';
import '../product/service_product/sales.dart';
import '../product/service_product/service-product.dart';
import 'category_product.dart';

class AnalyticsScreen extends StatefulWidget {
     static const String routeName = "/analytic";

  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Column(
        children:[
          Text(
            "Analytics",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]
      ),  
      leading: IconButton(
        icon: Container(
          width: 50,
          height: 60,
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
    body: earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '${totalSales}TND',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(
                height: 290,
                child: CategoryProductsChart(
                  seriesList: [
                    charts.Series(
                      id: 'Sales',
                      data: earnings!,
                      domainFn: (Sales sales, _) => sales.label,
                      measureFn: (Sales sales, _) => sales.earning,
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}
}