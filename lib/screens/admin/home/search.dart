  

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';
import '../../components/size_dart.dart';
import '../search/search.dart';
import 'homeheader.dart';

import '../search/search.dart';


class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _search();
}

class _search extends State<search> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
  
   return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  width: size.width * .7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(
                        Icons.search,
                         color:Color.fromARGB(255, 143, 20, 92),
                         
                      ),
                     Expanded(
  child: TextField(
    showCursor: false,
    onSubmitted: (String query) {
      navigateToSearchScreen(query); // Call the function when the text is submitted
    },
    decoration: InputDecoration(
      hintText: 'Search Product',
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
                        ),
                        
                      )
                      ),
                      
                      Icon(
                        Icons.mic,
                              color:Color.fromARGB(255, 143, 20, 92),
 
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
               
                 ElevatedButton(

          onPressed: (){

          },
          style: IconButton.styleFrom(
           backgroundColor :Color.fromARGB(255, 143, 20, 92),
      shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.all(
        Radius.circular(10)
        ),
      )
          ),
          child: SvgPicture.asset("assets/icons/filter.svg"),
           ),
              ]
            )
        );
  }
}