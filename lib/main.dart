import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

void main() {
  return runApp(NeumorphicApp());
}

class NeumorphicApp extends StatelessWidget {
  final Color baseColor = Colors.blueGrey.shade50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: baseColor,
        scaffoldBackgroundColor: baseColor,
        dialogBackgroundColor: baseColor,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  NeumorphicContainer(
                    child: Text(
                      'Button!',
                      style: Typography.blackCupertino.display2,
                    ),
                  ),
                  Spacer(),
                  NeumorphicContainer(
                    child: Text(
                      'Loooooooong Button',
                      style: Typography.blackCupertino.display2,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  NeumorphicContainer(
                    child: Icon(Icons.forward),
                  ),
                  Spacer(),
                  ClayContainer(
                    color: baseColor,
                    height: 33,
                    width: 33,
                    borderRadius: 50,
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  ClayContainer(
                    color: baseColor,
                    height: 150,
                    width: 150,
                    customBorderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(150, 150),
                      bottomRight: Radius.circular(50),
                    ),
                    curveType: CurveType.convex,
                  ),
                  Spacer(),
                  ClayContainer(
                    color: baseColor,
                    height: 150,
                    width: 150,
                    customBorderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(150, 150),
                      bottomLeft: Radius.circular(50),
                    ),
                    curveType: CurveType.convex,
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  ClayContainer(
                    color: baseColor,
                    height: 150,
                    width: 150,
                    customBorderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(150, 150),
                      topRight: Radius.circular(50),
                    ),
                    curveType: CurveType.convex,
                  ),
                  Spacer(),
                  ClayContainer(
                    color: baseColor,
                    height: 150,
                    width: 150,
                    customBorderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(150, 150),
                      topLeft: Radius.circular(50),
                    ),
                    curveType: CurveType.convex,
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  ClayContainer(
                    emboss: true,
                    color: baseColor,
                    height: 150,
                    width: 150,
                    borderRadius: 50,
                  ),
                  Spacer(),
                  ClayContainer(
                    color: baseColor,
                    height: 150,
                    width: 150,
                    borderRadius: 75,
                    depth: 40,
                    spread: 40,
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClayContainer(
                    color: baseColor,
                    height: 33,
                    width: 33,
                    borderRadius: 75,
                    curveType: CurveType.concave,
                  ),
                  SizedBox(width: 50),
                  ClayContainer(
                    color: baseColor,
                    height: 33,
                    width: 33,
                    borderRadius: 75,
                    curveType: CurveType.none,
                  ),
                  SizedBox(width: 50),
                  ClayContainer(
                    color: baseColor,
                    height: 33,
                    width: 33,
                    borderRadius: 75,
                    curveType: CurveType.convex,
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() {
    return _NeumorphicContainerState();
  }
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(
      () {
        _isPressed = true;
      },
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(
      () {
        _isPressed = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _isPressed ? color : color.mix(Colors.black, .1),
              _isPressed ? color.mix(Colors.black, .05) : color,
              _isPressed ? color.mix(Colors.black, .05) : color,
              color.mix(Colors.white, _isPressed ? .2 : .5),
            ],
            stops: [
              0.0,
              .3,
              .6,
              1.0,
            ],
          ),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: -widget.blurOffset,
                    color: color.mix(Colors.white, .6),
                  ),
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: widget.blurOffset,
                    color: color.mix(Colors.black, .3),
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
