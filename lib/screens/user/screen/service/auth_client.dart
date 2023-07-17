
import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../module/boutiqueproduct.dart';
import '../../../../module/client.dart';
import '../../../../module/employe.dart';
import '../../../../providers/provider.dart';
import '../../../components/error.dart';
import '../../../components/utils.dart';

class BoutiqueServices {
  void addProduct({
    required BuildContext context,
    required String nameboutique,
    required String address,
    required String category,
    required String numero,
    required String following,
    required String bio,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('deqhtegqa', 'dg3zu2rx');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: nameboutique),
        );
        imageUrls.add(res.secureUrl);
      }

      Client boutique = Client(
        nameboutique: nameboutique,
        address: address,
        category: category,
        images: imageUrls,
        bio: bio,
        numero: numero,
         
        
      );

      http.Response res = await http.post(
        Uri.parse('$uri/user/add-boutique'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: boutique.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'boutique Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  Future<void> updateboutique({
  required BuildContext context,
  required Client boutique,
  String?    nameboutique,
  String? category,
    String? numero,
  String? address,
  String? bio,
  List<File>? images,
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  try {
    final cloudinary = CloudinaryPublic('dctrbqz58', 'gwgk5fiv');
    List<String> imageUrls = [];

    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: boutique.id),
        );
        imageUrls.add(res.secureUrl);
      }
    }

    Map<String, dynamic> requestBody = {
      'nameboutique': nameboutique ?? boutique.nameboutique,
      'address': address ?? boutique.address,
      'bio': bio ?? boutique.bio,
      'category': category ?? boutique.category,
      'numero': numero ?? boutique.numero,
      'images': imageUrls.isNotEmpty ? imageUrls : boutique.images,
    };

    http.Response res = await http.put(
      Uri.parse('$uri/user/boutique/:boutiqueId'),
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
  Future<List<Client>> fetchAllboutique(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Client> boutiqueList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/user/get-boutiques'), headers: {
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
        Uri.parse('$uri/user/delete-boutique'),
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

 Future<List<Client>> fetchMyboutiques({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Client> boutiqueList = [];
    try {
      http.Response res =
           await http.get(Uri.parse('$uri/api/boutique/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
// httpErrorHandle gère les erreurs possibles de la requête HTTP et s'assure que la réponse est traitée avec succès
//crée des objets Order en utilisant la méthode fromJson pour convertir les données JSON en objets Order et ajoute ces objets à la liste orderList.
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

   void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
     required double promotion,
  required String color,
  required String marque,
  required String screenSize,
  required String materiau,
  required String country,
  required double livraison,
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

      Productboutique productsclient = Productboutique(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
         color: color, 
          screenSize: screenSize, 
          country: country,
           livraison: livraison,
           marque: marque,
            materiau:materiau, 
           promotion: promotion, 
        
      );

      http.Response res = await http.post(
        Uri.parse('$uri/user/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: productsclient.toJson(),
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
// get all the products
  Future<List<Productboutique>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Productboutique> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/user/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Productboutique.fromJson(
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
    required Productboutique productsclient,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/user/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': productsclient.id,
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
   void rateProduct({
    required BuildContext context,
  required Productboutique productsclient,
      required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': productsclient.id!,
          'rating': rating,
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
void addemploye({
  required BuildContext context,
    required String email,
    required String password,
    required String name,
   required String address,
required String type,
required int telephone,
 }) async {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      Employe employe = Employe(
        id: '',
        name: name,
        password: password,
        email: email,
        address: address,
       telephone: telephone,
        type: '',
        cart: [],
      );

           http.Response res = await http.post(
        Uri.parse('$uri/user/add-employe'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: employe.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Employe Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
 void deleteemploye({
    required BuildContext context,
    required Employe employe,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/user/delete-employe'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': employe.id,
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

   
   
 Future<List< Employe>> fetchAllemploye(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Employe> employeList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/user/get-employe'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            employeList.add(
              Employe.fromJson(
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
    return employeList;
  }

}