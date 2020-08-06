import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvedListItem extends StatelessWidget {
  final String title;
  final String time;
  final String people;
  final IconData icon;

  CurvedListItem({this.title, this.time, this.icon, this.people});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedRectangleClipper(),
      child: Container(
        color: Colors.pink,
        padding: EdgeInsets.only(
          left: 32,
          top: 100,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}

class CurvedRectangleClipper extends CustomClipper<Path> {
  final double offset = 80;
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height - offset);
    var firstEndpoint = Offset(offset, size.height);
    path.arcToPoint(firstEndpoint, radius: Radius.circular(-offset),clockwise: false);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, offset);
    path.lineTo(offset, offset);

    var secondEndPoint = Offset(0,0);

    path.arcToPoint(secondEndPoint, radius: Radius.circular(-offset),clockwise: true);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
