
import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../components/default.dart';
import '../../components/form_error.dart';

class addemploye extends StatelessWidget {
  static const String routeName = "/add_employe ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
         
     centerTitle: true,
    
      title:Column(
        children:[
       Text(
     "Add Employe  ",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
     
        ]
      ),  
        actions: [
          Padding(
            padding:const EdgeInsets.only(right:20,top:20),

            
            
          )
        ],
      ),
      body: Stack(
    children: [
     SafeArea(
      
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
              
              
                SignUpForm(),
              ]
            )
          )
               
        ),
      ),
     )
    ]
      )
    );
  }
}

enum Auth {
 
  signup,
}
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}
enum Type { user, client }
class _SignUpFormState extends State<SignUpForm> {
  Auth _auth = Auth.signup;
  final _formKey = GlobalKey<FormState>();
  final BoutiqueServices authService = BoutiqueServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
Type _type = Type.user;
  final TextEditingController _teleController = TextEditingController();

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
 @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _teleController.dispose();


  }

  void addemploye() {
authService.addemploye(
context: context,
email: _emailController.text,
password: _passwordController.text,
name: _nameController.text,
address: _addressController.text,
telephone:  int.parse(_teleController.text),
type: _type.toString(),
);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
             if (_auth == Auth.signup)
                       SizedBox(height: getProportionateScreenHeight(20)),

          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildadressFormField(),
                    SizedBox(height: getProportionateScreenHeight(20)),
buildTelFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          
          DefaultButton (
            text: "Continue",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                addemploye();
              }
            },
          ),
        ],
      ),
    );
  }


  TextFormField buildPasswordFormField() {
    TextEditingController password;
    return TextFormField(
      obscureText: true,
       controller: _passwordController,
      
     validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your password  ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        enabledBorder: OutlineInputBorder  (
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
   TextFormField buildadressFormField() {
    TextEditingController address;
    return TextFormField(
       controller: _addressController,
      
     validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your address  ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "address",
        hintText: "Enter your address",
        enabledBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildFirstNameFormField() {
    TextEditingController name;
    return TextFormField(
      controller: _nameController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your name ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Name",
        hintText: "Enter your name",
        enabledBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  IntlPhoneField buildTelFormField() {
   TextEditingController telephone;
  return IntlPhoneField(
           controller: _teleController,

    decoration: InputDecoration(
      labelText: "Number",
      hintText: "Enter your Number",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    initialCountryCode: 'US', // Set the initial country code (e.g., 'US' for United States)
    onChanged: (phone) {
      // Handle the phone number changes
      print(phone.completeNumber); // Access the complete phone number
    },
   
  );
}

  TextFormField buildEmailFormField() {
    TextEditingController email;
    return TextFormField(
         controller: _emailController,
   
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your email ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        
        enabledBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

}