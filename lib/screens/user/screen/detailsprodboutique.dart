import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../module/boutiqueproduct.dart';
import '../../../providers/provider.dart';
import '../../../size_config.dart';
import '../../admin/search/search.dart';
import '../../components/stars.dart';


class detailsproduct extends StatefulWidget {
  static const String routeName = "/details-prod";
   final Productboutique productsclient;
  const detailsproduct({
    Key? key,
    required this.productsclient,
  }) : super(key: key);
 @override
  State<detailsproduct> createState() => _detailsproduct();
}

class _detailsproduct extends State<detailsproduct> {

    final BoutiqueServices boutiqueServices = BoutiqueServices();

    final commentController = TextEditingController();
        final TextEditingController _nameController = TextEditingController();
  final _addcommentFormKey = GlobalKey<FormState>();

  double avgRating = 0;
  double myRating = 0;

  
  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.productsclient.rating!.length; i++) {
      totalRating += widget.productsclient.rating![i].rating;
      if (widget.productsclient.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.productsclient.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.productsclient.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  

  void addToCart() {
   
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
 floatingActionButton: _flotingButton(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _appBar(),
                _productImage(),
                
                ],
              ),
                     _detailWidget()
            ],
       
          ),
        ),
      ),
    );
  }

  bool isLiked = true;
  Widget _appBar() {
    
    return Container(
      
 padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(5)
              ),      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         
         IconButton(
          
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
           Text(
   "Product Details ",       
 style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Color.fromARGB(255, 241, 218, 218) : Color.fromARGB(255, 254, 254, 255),
              size: 15,
              padding: 12,
              isOutLine: false, ),
              
         
        ],
      ),
    );
  }

   Widget _icon(
    IconData icon, {
    Color color = LightColor.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
   
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color.fromARGB(255, 255, 255, 255),
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color.fromARGB(255, 255, 254, 254),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }

Widget _productImage() {
  return Hero(
    tag: widget.productsclient.id!,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 75),
      
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          CarouselSlider(
            items: widget.productsclient.images.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) => GestureDetector(
                    onTap: () {
                      // Navigate to a zoomable image view
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(i),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: 310,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.zoom_in,
              ),
              onPressed: () {
                
              }
            ),
          ),
        ],
      ),
    ),
  );
}




  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
                onPressed: addToCart,
      backgroundColor: Color.fromARGB(255, 190, 3, 91),
      child: Icon(Icons.shopping_basket,
      )
    );
  }

   Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
    
        return Container(
          padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(5)
              ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                            Text(
widget.productsclient.id!,   
         style: TextStyle( fontSize: 15,
            color: LightColor.black,),
           
          ),
          SizedBox(height: 10,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\$ ",
                                style: TextStyle(  fontSize: 18,
                                color: LightColor.red,),
                              
                              ),
                              Text(
  '${widget.productsclient.price} TND',

                             style: TextStyle( 
                                fontSize: 25,)
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[

                      Stars(
                      rating: avgRating,
                     )
                            ]
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                ),
                SizedBox(
                  height: 20,
                ),
                                         Text(
widget.productsclient.name,   
         style: TextStyle( fontSize: 30,
            color: LightColor.black,
            fontWeight: FontWeight.w500,
            fontFamily: AutofillHints.namePrefix),
           
          ),
               
                SizedBox(
                  height: 20,
                ),
                
                _description(),
                    SizedBox(
                  height: 20,
                ),
                 _availableSize(),
              ],
            ),
          ),
        );
      },
    );
  }

 Widget _description() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        widget.productsclient.description,
        style: TextStyle(fontSize: 13, color: Colors.black),
      ),
     SizedBox(height: 10),
      Text(
  'Promotion: ${widget.productsclient.promotion} %',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      Text(
      ' Size: ${widget.productsclient.screenSize}',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      
      Text(
       ' Color: ${widget.productsclient.color}',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      Text(
      '  Materiau: ${widget.productsclient.materiau}',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      Text(
       'Country : ${widget.productsclient.country}',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      Text(
        'shipping :${widget.productsclient.livraison}',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      Text(
        'Marque: ${widget.productsclient.marque}',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: 5,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                "See More Detail",
                style: TextStyle(
                  color: Color(0xffbf0772),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Color(0xffbf0772),
              ),

               
            ],
          ),
        ),
      ),
    
              
        SizedBox(height: 10),
      
      
            Text(
           "Customer reviews",
           style: TextStyle( fontSize: 14,color: Colors.black,
           fontWeight: FontWeight.bold),
         
        ),
              RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
        color: Color.fromARGB(255, 247, 142, 4)
              ),
              onRatingUpdate: (rating) {
                boutiqueServices.rateProduct(
                  context: context,
                  productsclient: widget.productsclient,
                  rating: rating,
                );
              },
            )    ],
            
      
    );
  }
  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
           "Top reviews ",
           style: TextStyle( fontSize: 14,color: Colors.black,
           fontWeight: FontWeight.bold),
         
        ),
           SizedBox(height: 20),
           
         Text(
           "fatma ben youssef ",
           style: TextStyle( fontSize: 14,color: Colors.black),
         
        ),
        Container(
margin: EdgeInsets.symmetric(horizontal: 10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Reviewed on May 10, 2023",
style: TextStyle(
fontSize: 10,
color: Colors.black,
),
),
SizedBox(height: 5),
Text(
"Been using this for like 3-5 months now and imma say, Its wonderful having this!",
style: TextStyle(
fontSize: 10,
color: Colors.black,
),
),
],
),
),
        SizedBox(height: 20),
        Divider(),
TextField(
controller: commentController,
decoration: InputDecoration(
hintText: 'Add a comment',
suffixIcon: IconButton(
icon: Icon(Icons.send),
onPressed: () {

},
),
),
),
      ],
    );
  }
   Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Text(
       text,
       style: TextStyle( fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,),
       
      ),
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Color",
          style: TextStyle( fontSize: 14,color: Colors.black),
         
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(LightColor.yellowColor, isSelected: true),
            SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.lightBlue),
            SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.black),
            SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.red),
            SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.skyBlue),
        
          ],
          
        ),
      
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }



}