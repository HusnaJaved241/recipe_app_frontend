import 'package:flutter/material.dart';
import 'dart:math';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  var random = Random();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // alignment: Alignment.bottomRight,
          children: [
            Positioned(
              bottom: 0,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.luminosity,
                ),
                child: Image.asset(
                  'assets/images/image${random.nextInt(11) + 1}.jpg',
                  height: height,
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: height / 1.85,
              left: 40,
              // right: 10,
              child: Text(
                'Make your own delicious recipes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'JosefinSans',
                ),
              ),
            ),
            Positioned(
              top: height / 1.35,
              left: 45,
              child: const Text(
                'Explore New Recipes, It\'s time 🤟',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
                child: Stack(
                  children: [
                    Positioned(
                      top: height / 1.2,
                      left: 85,
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 82,
                          left: 25,
                          top: 22,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.green.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 8), 
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Start Cooking',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height / 1.19,
                      right: 87,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 27,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
