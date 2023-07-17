import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpsScreen extends StatefulWidget {
  static const String routeName = "/helps";
  const HelpsScreen({Key? key}) : super(key: key);

  @override
  State<HelpsScreen> createState() => _HelpsScreenState();
}

class _HelpsScreenState extends State<HelpsScreen> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "Helps",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
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
          child: const Center(
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
      backgroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(width: 20),
       Expanded(
            child: Column(
       
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Access global markets overnight',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'ShopiTN Markets is the only global ecommerce solution where you can sell to multiple countries and scale internationally—all from one ShopiTn store.',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 48.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Get started',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Don’t have a ShopiTn store? Start free trial',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30,),
Column(
    children: [
      Divider(),
      FadeInLeft(
        duration: Duration(milliseconds: 800),
        child: Container(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Follow us',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 24,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                       SvgPicture.asset(
                  'assets/icons/twitter.svg',
                  height: 24,
                  color: Color.fromARGB(255, 15, 15, 15),
                ),
                SvgPicture.asset(
                  'assets/icons/instgaram.svg',
                  height: 24,
                  color: Color.fromARGB(255, 15, 15, 15),
                ),
               
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2023 Ecommerce. All rights reserved.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 3, 3, 3),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),          
  )
  )  ],
          ),
       ]   ),
   ) ]
    
  ),
),
  );
}
}


 