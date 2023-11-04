part of 'home_view.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * .3,
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
                      fontSize: boundNumber(screenSize.width * .08, 20, 10),
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

class OverlayTextSection extends StatelessWidget {
  const OverlayTextSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
        height: screenSize.height * .8,
        width: screenSize.width,
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: boundNumber(
                    screenSize.height / screenSize.width * 40, 300, 0),
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
        ));
  }
}

class _TitleText extends StatelessWidget {
  final double? top;
  final double? left;
  final String text;
  const _TitleText({
    Key? key,
    required this.text,
    this.top,
    this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          text,
          style: GoogleFonts.adamina(
              fontSize: 200, fontWeight: FontWeight.w900, color: Colors.white),
        ));
  }
}
