import 'package:band_website/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: boundNumber(screenSize.height * .85, 1000, 0),
      width: screenSize.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: boundNumber(screenSize.height / screenSize.width * 30, 300, 0),
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
          Positioned(
              top: boundNumber(screenSize.height * 2.5 / 7, 500, 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(boundNumber(
                      40 / screenSize.width,
                      40,
                      20)), // Adjust the radius as needed
                  child: SizedBox(
                    width: boundNumber(screenSize.width / 5, 230, 150),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          platformAwarePath("images/button-youtube.png"),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                openUrl('https://youtube.com/abandonquest');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
