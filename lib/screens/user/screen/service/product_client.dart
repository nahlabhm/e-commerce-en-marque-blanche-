

import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../module/order.dart';
import '../../../../module/productclient.dart';
import '../../../../providers/provider.dart';
import '../../../../providers/provider_client.dart';
import '../../../components/error.dart';
import '../../../components/utils.dart';


class ClientServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String sku,

    required List<File> images,
  }) async {

    try {
      final cloudinary = CloudinaryPublic('nahla12696', 'nahlabhm');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Productclient productclient = Productclient(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        price: price,
        sku: sku,
        
      );

  http.Response res = await http.post(
  Uri.parse('$uri/client/add-product'),
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    
  },
  body: productclient.toJson(),
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

}