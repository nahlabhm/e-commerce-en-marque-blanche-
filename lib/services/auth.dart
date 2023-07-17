import 'dart:convert';

import 'package:appmobile/screens/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../module/user.dart';
import '../providers/provider.dart';
import '../screens/components/error.dart';
import '../screens/components/utils.dart';


class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
   required String address,
required String type,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: address,
        type: '',
        token: '',
        cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri /api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
  Navigator.pushNamedAndRemoveUntil(
  context,
  Provider.of<UserProvider>(context, listen: false).user.type == 'user'
      ? baruserScreen.routeName
      : Provider.of<UserProvider>(context, listen: false).user.type == 'manager'
          ? barclientScreen.routeName
          : barScreen.routeName,
  (route) => false,
);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
Future<void> updateProfile({
  required BuildContext context,
  required UserProvider userProvider,
  String? name,
  String? email,
  String? password,
  String? address,
}) async {
  try {
    Map<String, dynamic> requestBody = {
      'name': name ?? userProvider.user.name,
      'email': email ?? userProvider.user.email,
      'password': password,
      'address': address,
    };

    http.Response res = await http.put(
      Uri.parse('$uri/profile'),
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
        userProvider.setUserFromModel(User.fromJson(res.body));
        showSnackBar(context, 'User updated successfully!');
        Navigator.pop(context);
      },
    );
  } catch (e) {
    throw e;
  }
}


   void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

