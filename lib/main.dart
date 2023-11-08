import 'package:band_website/bottom_section.dart';
import 'package:flutter/material.dart';
import '/welcome_screen.dart';
import 'helper_functions.dart';

void main() {
  runApp(MyScrollableWebsite());
}

class MyScrollableWebsite extends StatefulWidget {
  @override
  State<MyScrollableWebsite> createState() => _MyScrollableWebsiteState();
}

class _MyScrollableWebsiteState extends State<MyScrollableWebsite> {
  double fishDelta = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'Abandon Quest Video Game Band',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => Scaffold(
              body: NotificationListener(
                  onNotification: (notif) {
                    if (notif is ScrollUpdateNotification) {
                      if (notif.scrollDelta == null) return true;
                      setState(() {
                        fishDelta += notif.scrollDelta! / 2.0;
                      });
                    }
                    return true;
                  },
                  child: MainWidget(
                      fishDelta: fishDelta, screenSize: screenSize))),
          "splash-image": (context) =>
              Image.asset(platformAwarePath("images/band-photo_16x9.png"))
        });
  }
}

class MainWidget extends StatelessWidget {
  MainWidget({super.key, required this.fishDelta, required this.screenSize});
  final double fishDelta;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundContent(),
        TreasureChestFalling(fishDelta: fishDelta, screenSize: screenSize),
        FishiesSwimming(fishDelta: fishDelta, screenSize: screenSize),
        ListView(
          children: [
            Stack(
              children: [WelcomeScreen()],
            ),
            BottomSection(),
            SizedBox(
                width: 20,
                child:
                    Image.asset(platformAwarePath("images/show-bowser-ss.png")))
          ],
        ),
      ],
    );
  }
}

class TreasureChestFalling extends StatelessWidget {
  const TreasureChestFalling({
    super.key,
    required this.fishDelta,
    required this.screenSize,
  });

  final double fishDelta;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(
            0,
            fishDelta * 10 - screenSize.width / 2,
            0.0), // Translate by 50 units horizontally and 100 units vertically
        child: Transform.scale(
          scale: boundNumber(
            3.0 -
                (screenSize.height - 600.0) /
                    (1080.0 - 600.0) *
                    2.0, // Adjust the scaling factor
            1.0, // Maximum scale value
            0.5, // Minimum scale value
          ), // Adjust the scale factor as needed
          child: Image.asset(
              platformAwarePath("images/treasure-chest-falling.png"),
              height: screenSize.height),
        ));
  }
}

class FishiesSwimming extends StatelessWidget {
  const FishiesSwimming({
    super.key,
    required this.fishDelta,
    required this.screenSize,
  });

  final double fishDelta;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(
            fishDelta * 10 - screenSize.width / 2,
            0,
            0.0), // Translate by 50 units horizontally and 100 units vertically
        child: Transform.scale(
          scale: boundNumber(
            3.0 -
                (screenSize.height * .1 - 600.0) /
                    (1080.0 - 600.0) *
                    2.0, // Adjust the scaling factor
            1.0, // Maximum scale value
            0.2, // Minimum scale value
          ), // Adjust the scale factor as needed
          child: Image.asset(platformAwarePath("images/its-a-fish.png"),
              height: screenSize.height),
        ));
  }
}

class BackgroundContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Set the background content that moves to the right
      decoration: BoxDecoration(
        // You can set a background image here
        image: DecorationImage(
          image: AssetImage(platformAwarePath(
              "images/bg-real-ocean-dark.png")), // Replace with your image
          fit: BoxFit.cover, // You can experiment with different fit options
          alignment: Alignment.center, // Adjust alignment to control movement
        ),
      ),
    );
  }
}
