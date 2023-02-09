import 'package:flutter/material.dart';
class ClipCurveBackDSW extends StatelessWidget {
  const ClipCurveBackDSW({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueGrey[50],
        ),
        ClipPath(
          clipper: CliperShose(),
          child: Container(
            height: 260,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class CliperShose extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 70,
    );
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
