import 'package:flutter/material.dart';
import 'package:neomorphic_design/neumorphic_pie/neumorphic_pie.dart';

class MiddleRing extends StatelessWidget {
  final num pieWidth;

  const MiddleRing({Key key, @required this.pieWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: pieWidth,
      width: pieWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: pieWidth * 0.3,
          width: pieWidth * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(-1.5, -1.5),
                color: shadowColor,
                spreadRadius: 2.0,
                // blurRadius: 0,
              ),
              BoxShadow(
                offset: Offset(1.5, 1.5),
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
