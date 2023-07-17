import 'dart:io';

import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../module/client.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/utils.dart';

class updateboutique extends StatefulWidget {
  static const String routeName = '/update';

final int maxLines;
final Client boutique;
  const updateboutique({Key? key, this.maxLines =1,required this.boutique}): super(key:key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<updateboutique> {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _DescriptionController = TextEditingController();
       final TextEditingController _addressController = TextEditingController();
    final TextEditingController _domaineController = TextEditingController();
    final BoutiqueServices boutiqueServices = BoutiqueServices();
  String category = 'Mobiles';

  List<File> images = [];
  final _boutiqueFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _DescriptionController.dispose();
    _addressController.dispose();
    _domaineController.dispose();
  }
@override
void initState() { 
super.initState();
_nameController.text = widget.boutique.nameboutique;
_DescriptionController.text = widget.boutique.bio;
_addressController.text = widget.boutique.address;
_domaineController.text = widget.boutique.numero.toString();
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
  void updateboutique() {
    if (_boutiqueFormKey.currentState!.validate() && images.isNotEmpty) {
      final updatedboutique = Client(
      nameboutique: _nameController.text,
      bio: _DescriptionController.text,
      numero: _domaineController.text,
      address:_addressController.text ,
      category: category,
      images: images.map((file) => file.path).toList()
      );
    try {
   
        showSnackBar(context, 'Product updated successfully!');
        Navigator.pop(context);
    } catch (e) {
      showSnackBar(context, e.toString());
      return;
    }

    showSnackBar(context, 'Product updated successfully!');
    Navigator.pop(context);

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
           appBar: AppBar(
      centerTitle: true,
    
      title:Column(
        children:[
       Text(
     "Update Brands ",
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
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
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _boutiqueFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images
                          .map((i) => Builder(
                                builder: (BuildContext context) =>
                                    Image.file(
                                      i,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                      ),
                    )
                  : Container(),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: selectImages,
                icon: Icon(Icons.add),
                label: Text('Add Image'),
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
              
                
          
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateboutique,
                child: Text('Update Product')
                ,
              ),
            ],
          ),
        ),
      ),
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
        labelText: " Name Product",
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
    TextEditingController category;
    return TextFormField(
      controller: _domaineController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your numero ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " domaine",
        hintText: "Enter your domaine",
        

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