part of 'home_view.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: Color.fromARGB(99, 1, 187, 224),
      child: Stack(
        children: [
          Positioned.fill(
            top: -50,
            child: Center(
              child: Text(
                'Abandon Quest is a video game band from Minneapolis, Minnesota.',
                textAlign: TextAlign.center,
                style: GoogleFonts.biryani(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
                    child: Image.asset("images/title-and-octopus.png")),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                    width: boundNumber(screenSize.width, 900, 600),
                    child: Image.asset("images/people.png")),
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
