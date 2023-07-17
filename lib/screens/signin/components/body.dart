
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';
import '../../components/no_account_text.dart';
import '../../forgot_password/password_screen.dart';
import '../../socal_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            "assets/images/Neutral Minimalist Typography Vintage Monogram Logo (1).png",height: 110,),
            
 
    Text(
    "Welcome Back",
    style: TextStyle( 
    color: Colors.black,
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    ),
    ),
   
    Text(
    "Sign in with your email and password  \nor continue with social media",
    textAlign: TextAlign.center,
    ),
      SizedBox(height: SizeConfig.screenHeight * 0.08),
      SignForm(),
      SizedBox(height: SizeConfig.screenHeight * 0.08),
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
      SizedBox(height: getProportionateScreenHeight(20)),
      NoAccountText(),

          ],
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
 
  signin
}
class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}
class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
    Auth _auth = Auth.signin;

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? remember = false;
  final List<String?> errors = [];

  
@override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text, 
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
              if (_auth == Auth.signin)
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, PasswordScreen.routeName),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),

                )
              ],
            ),
           
            DefaultButton(text: "continue",
          onTap: () {
              if (_formKey.currentState!.validate()) {
                signInUser();
              }
              }
            ),


          ],
        ),
    );
  }
 TextFormField buildPasswordFormField() {
    TextEditingController password;
    return TextFormField(
       controller: _passwordController,
            obscureText: true,

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



