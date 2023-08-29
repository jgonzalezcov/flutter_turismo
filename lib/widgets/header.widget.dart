import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final String textHeader;
  final double heightHeader;

  const HeaderWidget({
    Key? key,
    required this.textHeader,
    required this.heightHeader,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlueRectangle(
        textHeader: widget.textHeader,
        heightHeader: widget.heightHeader,
      ),
    );
  }
}

class BlueRectangle extends StatelessWidget {
  final String textHeader;
  final double heightHeader;

  const BlueRectangle({
    Key? key,
    required this.textHeader,
    required this.heightHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: BlueRectanglePainter(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Icon(
                  Icons.sunny,
                  size: 60,
                  color: Color.fromARGB(255, 255, 255, 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  height: 49,
                  alignment: Alignment.topRight,
                  child:
                      const Image(image: AssetImage('assets/imgs/nieve.png'))),
            ),
            SizedBox(
              width: double.infinity,
              height: heightHeader,
              child: Center(
                child: Text(
                  textHeader,
                  style: const TextStyle(
                    fontFamily: 'Freehand',
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class BlueRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(
      colors: [
        Color.fromARGB(248, 0, 255, 234), // Verde
        Color.fromARGB(255, 39, 114, 23), // Azul
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    final Paint paint = Paint()
      ..shader = gradient.createShader(
          Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)))
      ..style = PaintingStyle.fill;
    const double borderRadius = 25.0;
    const double openingHeight = 3;
    const double openingWidthPercentage = 0.87;
    final double openingWidth = size.width * openingWidthPercentage;

    final RRect rRect = RRect.fromRectAndCorners(
      Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
      bottomLeft: const Radius.circular(borderRadius),
      bottomRight: const Radius.circular(borderRadius),
    );
    canvas.drawRRect(rRect, paint);
    final RRect openingRRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 1.3),
        width: openingWidth,
        height: openingHeight,
      ),
      topLeft: const Radius.circular(openingHeight / 2),
      topRight: const Radius.circular(openingHeight / 2),
      bottomLeft: const Radius.circular(openingHeight / 2),
      bottomRight: const Radius.circular(openingHeight / 2),
    );

    canvas.drawRRect(openingRRect, Paint()..color = Colors.orange);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
