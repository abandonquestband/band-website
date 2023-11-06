import 'package:band_website/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';


class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: boundNumber(screenSize.height * .3, 200, 100),
        width: screenSize.width,
        color: Color.fromARGB(99, 1, 187, 224),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Text(
                    'From Minneapolis, Minnesota, Abandon Quest puts unique spins on treasured tunes, with synchronized visuals or live gameplay.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.biryani(
                      color: Colors.white,
                      fontSize: boundNumber(screenSize.width * .07, 20, 8),
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}