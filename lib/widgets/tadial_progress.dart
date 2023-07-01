import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
class RadialProgress extends StatelessWidget {
  final double height, width, progress;
  final int value;

  const RadialProgress(
      {required this.height, required this.width, required this.progress, required this.value});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: progress),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "${value}",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF200087))),
                TextSpan(text: "\n"),
                TextSpan(
                    text: "kcal ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF200087))),
              ])),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  final double progress;

  RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    //canvas.drawCircle(center, size.width/2, paint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}