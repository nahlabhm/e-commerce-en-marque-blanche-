

import 'dart:io';

import 'package:appmobile/screens/admin/product/service_product/service-product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';
import '../../components/utils.dart';


class Body extends StatefulWidget {
final int maxLines;

  const Body({Key? key, this.maxLines =1}): super(key:key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _DescriptionController = TextEditingController();
    final TextEditingController _PriceController = TextEditingController();
    final TextEditingController _QuantiteController = TextEditingController();
     final TextEditingController _brandController = TextEditingController();
    final TextEditingController _colorController = TextEditingController();
    final TextEditingController _modelController = TextEditingController();
    final TextEditingController _screensizeController = TextEditingController();
    final TextEditingController _styleController = TextEditingController();
    final TextEditingController _specialFeatureController = TextEditingController();
    final TextEditingController _manufacturerController = TextEditingController();

    
    
    final AdminServices adminServices = AdminServices();

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
      _brandController.dispose();
        _modelController.dispose();
          _screensizeController.dispose();
            _styleController.dispose();
              _specialFeatureController.dispose();
                _colorController.dispose();
                  _manufacturerController.dispose();
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
      adminServices.sellProduct(
        context: context,
        name: _nameController.text,
        description: _DescriptionController.text,
        brand: _brandController.text,
        color: _colorController.text,
        model: _modelController.text,
        screenSize: _screensizeController.text,
        specialFeature: _specialFeatureController.text,
        style: _styleController.text,
        manufacturer: _manufacturerController.text,
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
    TextEditingController brand;
    return TextFormField(
      controller: _brandController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your brand ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Brand",
        hintText: "Enter your brand",
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
    TextEditingController model;
    return TextFormField(
      controller: _modelController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your model ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "model",
        hintText: "Enter your model",
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
    TextEditingController specialFeature;
    return TextFormField(
      controller: _specialFeatureController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your Shipping ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Shipping",
        hintText: "Enter your Shipping",
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
    TextEditingController manufacturer;
    return TextFormField(
      controller: _manufacturerController, 
    
    validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your manufacturer ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Name manufacturer",
        hintText: "Enter your manufacturer",
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
    TextEditingController style;
    return TextFormField(
      controller: _styleController, 
    
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