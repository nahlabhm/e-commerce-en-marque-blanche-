import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../components/default.dart';
import '../signin/signin_screen.dart';
import '../signup/signup_screen.dart';



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
    children: [
      Positioned(
top: 0,
right:0,
width:600,
 child: Image.asset(
            "assets/images/gratte-ciel-sous-angle-faible.jpg",
             fit: BoxFit.cover,
      color: Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
      colorBlendMode: BlendMode.softLight,
      ),
      ),
              SafeArea(
                   child: SizedBox(

    width: double.infinity,
    child: Column(
   children: [
    
      Text(
          "Welcome",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ),

        ),
          
       Text(
          "NOTHING IS IMPOSSIBLE",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w200,
          ),
        ),
        Spacer(),
 
            
        Text(
          "Let's Develop your Business",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(22),
            color: Color(0xffbf0772),
            fontWeight: FontWeight.bold,
          ),
        ),
    
         Text(
          "Get The Features You Need To Accelerate Your Activity",
                      textAlign:TextAlign.center,

          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Colors.white,
            fontWeight:FontWeight.normal,
            fontFamily: 'Multi'
          ),
        ),
       
        Spacer(flex: 3,),
    Expanded(
    flex: 2,
    child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: getProportionateScreenWidth(20)),
    child: Column(
    children: <Widget>[
      
     DefaultButton(
            text: "SKIP",
            onTap: (){
              Navigator.pushNamed(context, SigninScreen.routeName);
            }, 
  
          ),
Spacer(flex: 2,),
           Expanded(
            flex: 2,
             child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: getProportionateScreenWidth(100)),
           child: Row(
              children : <Widget>[
                
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, SigninScreen.routeName),
                  child: const Text(
                   "LOGIN ",
                      textAlign:TextAlign.center,
                        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
                        )
                      ),
                    Container(width:1, height: 30, color: Color.fromARGB(255, 248, 247, 247)), // This is divider
               GestureDetector(
                onTap: () => Navigator.pushNamed(context, SignupScreen.routeName),
                 child: const Text(

                   "SIGN UP ",
                      textAlign:TextAlign.center,
                         style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
                      ),
              )  
              ]
              
              )
              
           )
           )  
    ]
   
      )
       
      
    )
    )
    ]
    )
   )
              )
     ] )
      
   );
    

   
    


  }
}