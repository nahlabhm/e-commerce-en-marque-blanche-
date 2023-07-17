import 'dart:io';

import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../constants.dart';
import '../components/custom_surfix_icon.dart';
import '../components/default.dart';
import '../components/utils.dart';
class addproductclientScreen extends StatelessWidget {
  static const String routeName = "/add_product";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
         appBar: AppBar(
      centerTitle: true,
    
      title:Column(
        children:[
       Text(
     "Create Brands   ",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
     
        ]
      ),  
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(0.2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),
    body:Body(),
    );
  }
}



class Body extends StatefulWidget {
final int maxLines;

  const Body({Key? key, this.maxLines =1}): super(key:key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _DescriptionController = TextEditingController();
       final TextEditingController _addressController = TextEditingController();
    final TextEditingController _domaineController = TextEditingController();
    final BoutiqueServices boutiqueServices = BoutiqueServices();
 String category = 'Mobiles';
  List<File> images = [];
  final _productFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _DescriptionController.dispose();
    _addressController.dispose();
    _domaineController.dispose();
  }

  List<String> productCategories = [
    'Select Categories',
  'Mobiles',
 'Electronics',
 'Clothing & Shoes ',
 'Beauty & Personal Care',
 'Books',
 'Baby',
 'Industrial & Scientific',
 'Software',
 'Automotive',
 'Home & Kitchen',
 'Jewelry',
 'Sports & Outdoors',
 'Pet Supplies'
 
  ];

  void addProduct() {
    if (_productFormKey.currentState!.validate() && images.isNotEmpty) {
      boutiqueServices.addProduct(
        context: context,
        nameboutique: _nameController.text,
        bio: _DescriptionController.text,
        address: _addressController.text,
        numero: _domaineController.text,
          category: category,
        images: images, following: '', 
        
      );
    }
  }
   void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        child:Form(
           key: _productFormKey,
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
              const SizedBox(height: 20,),
               images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
            child:  DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern:const [10,4],
                strokeCap: StrokeCap.round,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.folder_open,size: 20,),
                      Text('select brands LOGO',
                      style: TextStyle(fontSize: 10,color: Colors.blueGrey),)
                    ],
                  ),
                ),
              ),
               ),
              const SizedBox(height: 20,),
              buildFirstNameFormField(),
            const SizedBox(height: 20,),
              buildDescriptionFormField(),
             const SizedBox(height: 20,),
             buildPriceFormField(),
            const SizedBox(height: 20,),
            buildQuantiteFormField(),
                const SizedBox(height: 10),
             
                  
    const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                  DefaultButton(text: "continue",
             onTap: addProduct,
                  )
               
            ]
            ),
            
            )
            )
            ),
      );
    
  }
 TextFormField buildFirstNameFormField() {
    TextEditingController nameboutique;
    return TextFormField(
      controller: _nameController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your name ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Name Boutique",
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/product.svg"),
      ),
    );
  }
  TextFormField buildDescriptionFormField() {
    TextEditingController bio;
    return TextFormField(
      controller: _DescriptionController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your name ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Description",
        hintText: "Enter your Description",
                  hintMaxLines:7,

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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/product.svg"),
      ),
    );
  }
   TextFormField buildPriceFormField() {
    TextEditingController numero;
    return TextFormField(
      controller: _domaineController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your numero ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Numero",
        hintText: "Enter your numero",
        

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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/product.svg"),
      ),
    );
  }
   TextFormField buildQuantiteFormField() {
    TextEditingController address;
    return TextFormField(
      controller: _addressController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your address ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " address",
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/product.svg"),
      ),
    );
  }
}