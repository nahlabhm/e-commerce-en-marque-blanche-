
import 'dart:io';

import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';
import '../../components/utils.dart';


class addprodboutique extends StatefulWidget {
final int maxLines;
 static const String routeName = "/add";

  const addprodboutique({Key? key, this.maxLines =1}): super(key:key);
  @override
  _addprodboutique createState() => _addprodboutique();
}
class _addprodboutique extends State<addprodboutique> {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _DescriptionController = TextEditingController();
    final TextEditingController _PriceController = TextEditingController();
    final TextEditingController _QuantiteController = TextEditingController();
     final TextEditingController _promotionController = TextEditingController();
    final TextEditingController _colorController = TextEditingController();
    final TextEditingController _marqueController = TextEditingController();
    final TextEditingController _screensizeController = TextEditingController();
    final TextEditingController _materiauController = TextEditingController();
    final TextEditingController _countryController = TextEditingController();
    final TextEditingController _livraisonController = TextEditingController();

    
    
    final BoutiqueServices boutiqueServices = BoutiqueServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _DescriptionController.dispose();
    _PriceController.dispose();
    _QuantiteController.dispose();
      _materiauController.dispose();
        _marqueController.dispose();
          _screensizeController.dispose();
            _livraisonController.dispose();
              _countryController.dispose();
                _colorController.dispose();
                  _promotionController.dispose();
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

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      boutiqueServices.sellProduct(
        context: context,
        name: _nameController.text,
        description: _DescriptionController.text,
        promotion:double.parse(_promotionController.text),
        color: _colorController.text,
        livraison: double.parse(_livraisonController.text),
        screenSize: _screensizeController.text,
        marque: _marqueController.text,
        materiau: _materiauController.text,
        country: _countryController.text,
        price: double.parse(_PriceController.text),
        quantity: double.parse(_QuantiteController.text),
        category: category,
        images: images,
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
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
           
            Text(
              "Add product",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          
        ),
        leading: IconButton(
  icon: Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black.withOpacity(0.2)),
    ),
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
        child:Form(
           key: _addProductFormKey,
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
                      Text('select Product Images',
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
                buildbrandFormField(),
     const SizedBox(height: 10,),
                buildsizeFormField(),
                                const SizedBox(height: 10,),

                buildcolorFormField(),
                                const SizedBox(height: 10,),

                buildmodelFormField(),
                                                const SizedBox(height: 10,),

                buildspecialFormField(),
                                                const SizedBox(height: 10,),

                buildmanufacturerFormField(),
                                                const SizedBox(height: 10,),

                buildStyleFormField(),
                                const SizedBox(height: 20,),

                SizedBox(
                
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
              
                  DefaultButton(text: "continue",
             onTap: sellProduct,
                  )
                  
               
            ]
            ),
            
            )
            )
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
    TextEditingController description;
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
    TextEditingController price;
    return TextFormField(
      controller: _PriceController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your price ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Price",
        hintText: "Enter your Price",
        

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
    TextEditingController quantity;
    return TextFormField(
      controller: _QuantiteController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your Quantite ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Quantite",
        hintText: "Enter your Quantite",

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
   TextFormField buildbrandFormField() {
    TextEditingController promotion;
    return TextFormField(
      controller: _promotionController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your promotion ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Promotion",
        hintText: "Enter your promotion",
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
   TextFormField buildsizeFormField() {
    TextEditingController screenSize;
    return TextFormField(
      controller: _screensizeController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your size ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Size",
        hintText: "Enter your size",
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
  TextFormField buildcolorFormField() {
    TextEditingController color;
    return TextFormField(
      controller: _colorController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your color ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " color",
        hintText: "Enter your color",
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
  } TextFormField buildmodelFormField() {
    TextEditingController marque;
    return TextFormField(
      controller: _marqueController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your marque ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "marque",
        hintText: "Enter your marque",
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
  } TextFormField buildspecialFormField() {
    TextEditingController materiau;
    return TextFormField(
      controller: _materiauController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your materiau ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " materiau",
        hintText: "Enter your materiau",
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
  } TextFormField buildmanufacturerFormField() {
    TextEditingController livraison;
    return TextFormField(
      controller: _livraisonController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your shipping ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " shipping",
        hintText: "Enter your shipping",
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
  } TextFormField buildStyleFormField() {
    TextEditingController country;
    return TextFormField(
      controller: _countryController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your Country of Origin ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Name Country of Origin",
        hintText: "Enter your Country of Origin",
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