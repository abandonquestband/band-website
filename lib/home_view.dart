import 'package:band_website/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home_view.widgets.dart';

const overlayDescriptionText =
    'I have to write some stuff to put in here so that it looks like there\'s something real written here. So lets write some real stuff here. A few weeks ago I concluded the biggest failure of my career. I founded a new startup and poured all my money and energy into it and it failed. The reasons for failure are clear and if you\'d like to hear I can make a video about that. For now that\'s all that I\'ll say.';
const backgroundImageUrl = 'https://source.unsplash.com/XO5qTnr0a50';

class TopBottomCropClipper extends CustomClipper<Rect> {
  final double topCropHeight;
  final double bottomCropHeight;

  TopBottomCropClipper(this.topCropHeight, this.bottomCropHeight);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        0, topCropHeight, size.width, size.height - bottomCropHeight);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 13, 45),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (context) {
              return Image.asset(
                height: screenSize.height,
                width: screenSize.width,
                platformAwarePath("images/bg-real-ocean-dark.png"),
                fit: BoxFit.cover,
              );
            },
            offsetBuilder: ((scrollOffset) => Offset(0, scrollOffset)),
          ),
          ScrollTransformItem(
            builder: (context) {
              return Image.asset(
                  height: screenSize.height,
                  platformAwarePath("images/its-a-fish.png"),
                  fit: BoxFit.fitWidth);
            },
            offsetBuilder: ((scrollOffset) => Offset(
                scrollOffset * .2 - screenSize.width * .08,
                -screenSize.height + scrollOffset)),
          ),
          ScrollTransformItem(
            builder: (context) {
              return const OverlayTextSection();
            },
            offsetBuilder: ((scrollOffset) =>
                Offset(0, -screenSize.height * 2)),
          ),
          ScrollTransformItem(
            builder: (context) {
              return const BottomSection();
            },
            offsetBuilder: ((scrollOffset) =>
                Offset(0, -screenSize.height * 2)),
          ),
        ],
      ),
    );
  }
}
