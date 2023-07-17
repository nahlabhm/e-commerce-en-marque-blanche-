import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../module/order.dart';
import '../../../module/product.dart';
import '../../../module/user.dart';
import '../../../providers/provider.dart';
import '../../components/error.dart';
import '../../components/utils.dart';
class AddressServices {
  void saveUserAddress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/save-user-address'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'address': address,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            address: jsonDecode(res.body)['address'],
          );

          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get all the products
 void placeOrder({
  required BuildContext context,
  required String address,
  required String username,
  required int telephone,
  required double totalSum,
  required int card,
  required int cv,
  required String createdAt,
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  try {
    final Map<String, dynamic> requestBody = {
      'cart': userProvider.user.cart,
      'address': address,
      'totalPrice': totalSum,
      'username': username,
      'telephone': telephone,
      'card':card,
      'cv':cv ,
      'createdAt':createdAt,
    };

   

    final http.Response res = await http.post(
      Uri.parse('$uri/api/order'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
      body: jsonEncode(requestBody),
    );

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        showSnackBar(context, 'Your order has been placed!');
        User user = userProvider.user.copyWith(
          cart: [],
        );
        userProvider.setUserFromModel(user);

    
      },
    );
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

void payments({
  required BuildContext context,
  required Order order,
  required int card,
  required int cv,
  required String name,
  required String createdAt,
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  try {
    http.Response res = await http.post(
      Uri.parse('$uri/api/payment'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
      body: jsonEncode({
        'id': order.id,
        'card': card,
        'cv': cv,
        'name': name,
        'createdAt': createdAt,
      }),
    );

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {},
    );
  } catch (e) {
    showSnackBar(context, e.toString());
  }
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
}


