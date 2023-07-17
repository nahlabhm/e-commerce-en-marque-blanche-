import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../module/user.dart';
import '../../../providers/provider.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';
import '../../components/form_error.dart';
import '../../components/utils.dart';
class UpdateForm extends StatefulWidget {
  static const String routeName = "/post";
 
  const UpdateForm({Key? key,}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool remember = false;
  final List<String?> errors = [];

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
  }

  @override
void initState() {
super.initState();

}

void updateprofile ()async{

   if (_formKey.currentState!.validate()) {
  
        // Mettre à jour les informations de l'utilisateur
final user = Provider.of<UserProvider>(context).user;
       final updateprofile= User(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          address: _addressController.text, cart: [], id: '', token: '', type: '',
        );
        try {
   
        showSnackBar(context, 'User updated successfully!');
        Navigator.pop(context);
    } catch (e) {
      showSnackBar(context, e.toString());
      return;
    }
      showSnackBar(context, 'Product updated successfully!');
    Navigator.pop(context);
  }
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: Text('Update Product'),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                       const SizedBox(height: 20),

          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildadressFormField(),
                    SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
         DefaultButton(
  text: "Continue",
  onTap: () async {
    updateprofile();
   
  },
)

        ],
      ),
        )
      )
    )
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