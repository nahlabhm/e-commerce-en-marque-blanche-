
import 'package:appmobile/screens/splash/components/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// This is the best practice
import '../../../constants.dart';
import '../../signup/signup_screen.dart';
import 'animation.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
 


  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: kBackgroundColor,
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // image transition
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: const <Widget>[
                ImageListView(startIndex: 0),
                ImageListView(startIndex: 1),
                ImageListView(startIndex: 2),
              ],
            ),
          ),

          // back button
          Positioned(
            left: 20,
            top: MediaQuery.of(context).padding.top + 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Color.fromARGB(255, 248, 246, 246),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Color.fromARGB(255, 248, 246, 246),
              iconSize: 30.0,
            ),
          ),

          // title
          Positioned(
            top: MediaQuery.of(context).size.height * .08,
            child: Text(
              'BIG SHOPPING',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

            // information
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.transparent,
                      Colors.white60,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Your Appearance\nShows Your Quality',
                      textAlign: TextAlign.center,
                  
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Change The Quality Of Your\nAppearance with BIG SHOPPING',
                      textAlign: TextAlign.center,
                    
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildIndicators(),
                    ),
                  ],
                ),
              ),
            ),

            // bottom button
            Positioned(
              bottom: 30,
              right: 20,
              left: 20,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () 
                  {
                Navigator.pushNamed(context, SignupScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Sign Up with Email'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





