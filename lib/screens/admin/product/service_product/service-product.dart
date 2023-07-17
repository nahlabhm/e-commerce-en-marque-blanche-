
import 'dart:convert';
import 'dart:io';

import 'package:appmobile/screens/admin/product/service_product/sales.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../module/client.dart';
import '../../../../module/order.dart';
import '../../../../module/product.dart';
import '../../../../providers/provider.dart';
import '../../../components/error.dart';
import '../../../components/utils.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
     required String brand,
  required String color,
  required String model,
  required String screenSize,
  required String style,
  required String specialFeature,
  required String manufacturer,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
            final cloudinary = CloudinaryPublic('deqhtegqa', 'dg3zu2rx');

      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
         brand: brand, 
         color: color, 
         manufacturer: manufacturer, 
         model: model,
          screenSize: screenSize, 
          specialFeature: specialFeature, style:style,
        
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

Future<void> updateProduct({
  required BuildContext context,
  required Product product,
  String? name,
  String? description,
  double? price,
  double? quantity,
  String? category,
  List<File>? images,
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  try {
    final cloudinary = CloudinaryPublic('dctrbqz58', 'gwgk5fiv');
    List<String> imageUrls = [];

    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: product.id),
        );
        imageUrls.add(res.secureUrl);
      }
    }

    Map<String, dynamic> requestBody = {
      'name': name ?? product.name,
      'description': description ?? product.description,
      'price': price ?? product.price,
      'quantity': quantity ?? product.quantity,
      'category': category ?? product.category,
      'images': imageUrls.isNotEmpty ? imageUrls : product.images,
    };

    http.Response res = await http.put(
      Uri.parse('$uri/admin/products/${product.id}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
      body: jsonEncode(requestBody),
    );

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {},
    );
  } catch (e) {
    throw e;
  }
}

  // get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
    void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
Future<List<Order>> fetchAllOrders(BuildContext context) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<Order> orderList = [];

  try {
    http.Response res = await http.get(
      Uri.parse('$uri/admin/get-orders'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
    );

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        final responseData = jsonDecode(res.body) as List<dynamic>;
        orderList = responseData.map((data) => Order.fromJson(data)).toList();
      },
    );
  } catch (e) {
    showSnackBar(context, e.toString());
  }

  return orderList;
}
  void changeOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/change-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<Map<String, dynamic>> getEarnings(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Sales> sales = [];
    int totalEarning = 0;
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/analytics'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          totalEarning = response['totalEarnings'];
          sales = [
            Sales('M', response['mobileEarnings']),
            Sales('E', response['ElectronicsEarnings']),
            Sales('C', response['ClothingEarnings']),
            Sales('B', response['BeautyEarnings']),
            Sales('BO', response['BooksEarnings']),
            Sales('BA', response['BabyEarnings']),
            Sales('I', response['IndustrialEarnings']),
            Sales('SO', response['SoftwareEarnings']),
            Sales('A', response['AutomotiveEarnings']),
            Sales('H', response['HomeEarnings']),
            Sales('J', response['JewelryEarnings']),
            Sales('SP', response['SportsEarnings']),
            Sales('SUP', response['SuppliesEarnings']),

          ];
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return {
      'sales': sales,
      'totalEarnings': totalEarning,
    };
  }

  
  // get all the products
  Future<List<Client>> fetchAllboutique(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Client> boutiqueList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-boutiques'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            boutiqueList.add(
              Client.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return boutiqueList;
  }

      void deleteboutique({
    required BuildContext context,
    required Client boutique,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-boutique'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': boutique.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

   Future<Map<String, dynamic>> getEarningsboutique(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Sales> sales = [];
    int totalEarning = 0;
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/user/analytics'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          totalEarning = response['totalEarnings'];
          sales = [
            Sales('Mobiles', response['mobileEarnings']),
            Sales('Electronics', response['ElectronicsEarnings']),
            Sales('Clothing', response['ClothingEarnings']),
            Sales('Beauty', response['BeautyEarnings']),
            Sales('Books', response['BooksEarnings']),
            Sales('Baby', response['BabyEarnings']),
            Sales('Industrial', response['IndustrialEarnings']),
            Sales('Software', response['SoftwareEarnings']),
            Sales('Automotive', response['AutomotiveEarnings']),
            Sales('Home', response['HomeEarnings']),
            Sales('Jewelry', response['JewelryEarnings']),
            Sales('Sports', response['SportsEarnings']),
            Sales('Supplies', response['SuppliesEarnings']),

          ];
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return {
      'sales': sales,
      'totalEarnings': totalEarning,
    };
  }

  
}