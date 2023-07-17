
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';
import '../../components/button.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';
import '../../components/form_error.dart';
import '../../socal_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
         
   
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
                Image.asset(
            "assets/images/Neutral Minimalist Typography Vintage Monogram Logo (1).png",height: 90,),
          
                Text("Register Account"),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
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
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
Type _type = Type.user;
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
  }

  void signUpUser() {
authService.signUpUser(
context: context,
email: _emailController.text,
password: _passwordController.text,
name: _nameController.text,
address: _addressController.text,
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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildadressFormField(),
                    SizedBox(height: getProportionateScreenHeight(20)),

          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          
          DefaultButton (
            text: "Continue",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                signUpUser();
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/address-svgrepo-com.svg"),
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

}