import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../module/product.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';
import '../../components/utils.dart';

class UpdateProductPage extends StatefulWidget {
static const String routeName = '/update';

final Product product;
const UpdateProductPage({
Key? key,
required this.product,
}) : super(key: key);

@override
_UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
final TextEditingController _nameController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final TextEditingController _priceController = TextEditingController();
final TextEditingController _quantityController = TextEditingController();
        final TextEditingController _brandController = TextEditingController();
    final TextEditingController _colorController = TextEditingController();
    final TextEditingController _modelController = TextEditingController();
    final TextEditingController _screensizeController = TextEditingController();
    final TextEditingController _styleController = TextEditingController();
    final TextEditingController _specialFeatureController = TextEditingController();
    final TextEditingController _manufacturerController = TextEditingController();

String category = 'Mobiles';
List<File> images = [];

final _formKey = GlobalKey<FormState>();

@override
void initState() {
super.initState();
_nameController.text = widget.product.name;
_descriptionController.text = widget.product.description;
_priceController.text = widget.product.price.toString();
_quantityController.text = widget.product.quantity.toString();
category = widget.product.category;
}

@override
void dispose() {
_nameController.dispose();
_descriptionController.dispose();
_priceController.dispose();
_quantityController.dispose();
 _brandController.dispose();
        _modelController.dispose();
          _screensizeController.dispose();
            _styleController.dispose();
              _specialFeatureController.dispose();
                _colorController.dispose();
                  _manufacturerController.dispose();
super.dispose();
}

void updateProduct() async {
  if (_formKey.currentState!.validate() && images.isNotEmpty) {
    final updatedProduct = Product(
      id: widget.product.id,
      name: _nameController.text,
      description: _descriptionController.text,
      price: double.parse(_priceController.text),
      quantity: double.parse(_quantityController.text),
      category: category,
       brand: _brandController.text,
        color: _colorController.text,
        model: _modelController.text,
        screenSize: _screensizeController.text,
        specialFeature: _specialFeatureController.text,
        style: _styleController.text,
        manufacturer: _manufacturerController.text,
      images: images.map((file) => file.path).toList(), comments: [],
    );

    // Call the updateProduct API endpoint here, passing in the updatedProduct object.
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
try {
  var res = await pickImages();
  setState(() {
    images = res;
  });
} catch (e) {
  print('Error picking images: $e');
}
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
    
      title:Column(
        children:[
       Text(
     "Update Product  ",
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
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
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
                onPressed: updateProduct,
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
      controller: _descriptionController, 
    
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
      controller: _priceController, 
    
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
      controller: _quantityController, 
    
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
}
