import 'package:appmobile/size_config.dart';
import 'package:flutter/material.dart';

String uri = 'http://10.99.1.149:3000';
const kPrimaryColor = Color.fromARGB(255, 134, 96, 119);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const Color kBackgroundColor = Color(0xff292526);
const Color kOrangeColor = Color(0xffE59252);
const Color kGreyColor = Color.fromARGB(255, 230, 230, 230);
const Color kRedColor = Color.fromARGB(255, 255, 44, 44);
const kAnimationDuration = Duration(milliseconds: 200);
class LightColor {
  static const Color background = Color(0XFFFFFFFF);

  static const Color titleTextColor = const Color(0xff1d2635);
  static const Color subTitleTextColor = const Color(0xff797878);

  static const Color skyBlue = Color(0xff2890c8);
  static const Color lightBlue = Color(0xff5c3dff);
  

  static const Color orange = Color(0xffE65829);
  static const Color red = Color(0xffF72804);

  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color grey = Color(0xffA1A3A6);
  static const Color darkgrey = Color(0xff747F8F);
  
  static const Color iconColor = Color(0xffa8a09b);
  static const Color yellowColor = Color(0xfffbba01);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);

}
class GlobalVariables {

static const List<Map<String, String>> categoryImages = [
   {
      'title': 'Mobiles',
      'image': 'assets/images/rami-al-zayat-w33-zg-dNL4-unsplash.jpg',
    },
   
    {
      'title': 'Electronics',
      'image': 'assets/images/andy-holmes-EOAKUQcsFIU-unsplash.jpg',
    },
    {
      'title': 'Clothing & Shoes ',
      'image': 'assets/images/domino-164_6wVEHfI-unsplash.jpg',
    },
       {
      'title': 'Beauty & Personal Care',
      'image': 'assets/images/2617355.jpg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/shiromani-kant-mo3FOTG62ao-unsplash.jpg',
    },
 
       {
      'title': ' Baby',
      'image': 'assets/images/markus-spiske-OO89_95aUC0-unsplash.jpg',
    },
       {
      'title': 'Industrial & Scientific',
      'image': 'assets/images/téléchargement (3).jpg',
    },
         {
      'title': 'Software',
      'image': 'assets/images/téléchargement (4).jpg',
    },
         {
      'title': 'Automotive',
      'image': 'assets/images/lyes-lahlou-nCCBrx_zwvE-unsplash.jpg',
    },
     {
      'title': 'Home & Kitchen',
      'image': 'assets/images/chris-kursikowski-Q3IkBtFhSeQ-unsplash.jpg',
    }, {
      'title': 'Jewelry',
      'image': 'assets/images/laurenz-heymann-z6lNa2jYaVw-unsplash.jpg',
    }, {
      'title': 'Sports & Outdoors',
      'image': 'assets/images/guilherme-maggieri-OH5g9IgcMWs-unsplash.jpg',
    }, {
      'title': 'Pet Supplies',
      'image': 'assets/images/chris-benson-OW-y36D37c4-unsplash.jpg',
    },
     
  ];
}

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const kDefaultPaddin = 20.0;

