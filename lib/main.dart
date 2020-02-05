import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:neomorphic_design/neumorphic_bar.dart';
import 'package:neomorphic_design/neumorphic_pie/neumorphic_pie.dart';

void main() {
  return runApp(NeumorphicApp());
}

class NeumorphicApp extends StatelessWidget {
  static final Color baseColor = Colors.blueGrey.shade50;

  final List<String> _tabs = [
    'Buttons',
    'Bars & Pie',
    'Blur (slow)',
    'Clay Text',
  ];

  static final Map<int, Color> colorSwatch = {
    50: Color.fromRGBO(0, 200, 156, .1),
    100: Color.fromRGBO(0, 200, 156, .2),
    200: Color.fromRGBO(0, 200, 156, .3),
    300: Color.fromRGBO(0, 200, 156, .4),
    400: Color.fromRGBO(0, 200, 156, .5),
    500: Color.fromRGBO(0, 200, 156, .6),
    600: Color.fromRGBO(0, 200, 156, .7),
    700: Color.fromRGBO(0, 200, 156, .8),
    800: Color.fromRGBO(0, 200, 156, .9),
    900: Color.fromRGBO(0, 200, 156, 1),
  };

  static final MaterialColor colorCustom =
      MaterialColor(0xFF00C89C, colorSwatch);

  static final TextTheme textTheme = TextTheme(
    title: TextStyle(color: Colors.white),
  );

  static final ThemeData theme = ThemeData(
    primarySwatch: colorCustom,
    backgroundColor: baseColor,
    scaffoldBackgroundColor: baseColor,
    dialogBackgroundColor: baseColor,
    primaryTextTheme: textTheme,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic App',
      theme: theme,
      home: Scaffold(
        body: DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Neumorphic Designs'),
              bottom: TabBar(
                tabs: _tabs.map(
                  (String name) {
                    return Tab(text: name);
                  },
                ).toList(),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                _page1(baseColor),
                _page2(),
                _page3(),
                _page4(baseColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Stack _page3() {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Container(
        child: Image.network(
          'https://loving-newyork.com/wp-content/uploads/2018/09/Empire-State-Building-New-York_160914155540010-e1537863672134.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.0,
            sigmaY: 1.0,
          ),
          child: Scaffold(
            // Your usual Scaffold for content
            backgroundColor: Colors.black12,
            body: Container(),
          ),
        ),
      ),
    ],
  );
}

Center _page4(Color baseColor) {
  return Center(
    child: Column(
      children: <Widget>[
        Spacer(),
        Row(
          children: <Widget>[
            Spacer(),
            ClayText(
              'Hello!',
              size: 33.0,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Spacer(),
            ClayText(
              'Hello but embossed',
              size: 33.0,
              emboss: true,
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
  );
}

Center _page2() {
  return Center(
    child: Column(
      children: <Widget>[
        BarDays(),
        Spacer(),
        NeumorphicPie(),
        Spacer(),
      ],
    ),
  );
}

class BarDays extends StatelessWidget {
  const BarDays({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 0.5,
          text: 'Mon',
        ),
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 0.9,
          text: 'Tue',
          color: Color.fromRGBO(0, 200, 156, 1),
        ),
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 0.25,
          text: 'Wed',
          color: Colors.red,
        ),
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 1,
          text: 'Thur',
        ),
      ],
    );
  }
}

Center _page1(Color baseColor) {
  return Center(
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
  );
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
