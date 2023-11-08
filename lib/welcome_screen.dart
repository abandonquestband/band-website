import 'package:band_website/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * .8,
      width: screenSize.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: boundNumber(screenSize.height / screenSize.width * 40, 300, 0),
            child: SizedBox(
                width: boundNumber(screenSize.width, 800, 100),
                child: Image.asset(
                    platformAwarePath("images/title-and-octopus.png"))),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
                width: boundNumber(screenSize.width, 900, 300),
                child: Image.asset(platformAwarePath("images/people.png"))),
          ),
        ],
      ),
    );
  }
}
