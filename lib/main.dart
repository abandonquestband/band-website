import 'package:band_website/bottom_section.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import '/welcome_screen.dart';
import 'helper_functions.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'dart:html' as html;

void main() {
  setPathUrlStrategy();
  runApp(MyScrollableWebsite());
}

class MyScrollableWebsite extends StatefulWidget {
  @override
  State<MyScrollableWebsite> createState() => _MyScrollableWebsiteState();
}

class _MyScrollableWebsiteState extends State<MyScrollableWebsite> {
  double fishDelta = 0;
  String _initialRoute = '';

  @override
  void initState() {
    String initialUrl = html.window.location.href;
    final url = Uri.parse(initialUrl);
    final lastPathSegment =
        url.pathSegments.isNotEmpty ? url.pathSegments.last : 'default';
    _initialRoute = lastPathSegment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'Abandon Quest Video Game Band ${screenSize.height}',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: _initialRoute,
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



class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // Define the clipping area
    final topMargin = 0.0; // Adjust this value to control how much to clip from the top
    final bottomMargin = 0.0; // Adjust this value to control how much to clip from the bottom
    return Rect.fromLTRB(
      0, 
      topMargin, 
      size.width, 
      size.height - bottomMargin
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
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
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRect(
                    clipper: MyCustomClipper(),
                    child:Container(color: Color.fromARGB(120, 0, 0, 0), height: boundNumber(8/17*screenSize.width, 500, 100), child:SplashVideo()))
                  // Container(
                  //     width: boundNumber(screenSize.width, 1000, 0),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Color.fromARGB(99, 1, 187, 224),
                  //         width: 8.0, // Border thickness
                  //       ),
                  //       color: Color.fromARGB(99, 1, 187, 224),
                  //       borderRadius: BorderRadius.circular(12.0),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: const Color.fromARGB(255, 0, 0, 0)
                  //               .withOpacity(0.5), // Shadow color
                  //           blurRadius: 5.0, // Shadow blur radius
                  //           offset: Offset(0, 2), // Shadow offset
                  //         ),
                  //       ],
                  //     ),
                      // child: ClipRRect(
                      //   child: Align(
                      //     alignment: Alignment.center,
                      //     heightFactor:
                      //         boundNumber(500 / screenSize.height, 1, .3),
                      //     child: Image.asset(
                      //         platformAwarePath("images/show-bowser-ss.png")),
                      //   ),
                      // )
                      // ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SplashVideo extends StatefulWidget {
  const SplashVideo({
    super.key,
  });

  @override
  State<SplashVideo> createState() => _SplashVideoState();
}

class _SplashVideoState extends State<SplashVideo> {
  final VideoPlayerController videoPlayerController = VideoPlayerController.networkUrl(
    Uri.parse("https://github.com/abandonquestband/sheet-hub-public/raw/main/splash-video.mp4"));
  ChewieController? chewieController;
  @override
  void initState() {

    super.initState();
    _initPlayer();
  }


  void _initPlayer() async {
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      
      looping: false,
      showOptions: true,
      showControls: true
      // additionalOptions: (context) {
      //   return <OptionItem>[
      //     OptionItem(
      //       onTap: () => debugPrint('Option 1 pressed!'),
      //       iconData: Icons.chat,
      //       title: 'Option 1',
      //     ),
      //     OptionItem(
      //       onTap: () =>
      //           debugPrint('Option 2 pressed!'),
      //       iconData: Icons.share,
      //       title: 'Option 2',
      //     ),
      //   ];
      // },
    );
  }


  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return chewieController!=null ? Chewie(
          controller: chewieController!,
        ) : SizedBox();
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
            fishDelta * .3 * 10 - screenSize.width / 2,
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
