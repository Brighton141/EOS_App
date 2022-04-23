import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/screens/newProspectScreen.dart';
import 'dart:math' as math;

import '../models/tabIcon_data.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key? key, required this.tabIconsList, required this.changeIndex, required this.addClick})
      : super(key: key);

  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconsList;

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController?.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: Colors.white,
                elevation: 60.0,
                clipper: TabClipper(
                    radius: Tween(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                        parent: animationController!,
                        curve: Curves.fastOutSlowIn))
                        .value *
                        54.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                        height: 64,
                        child: Padding(
                          padding:
                            const EdgeInsets.only(left: 6, right: 6),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList[0],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(widget.tabIconsList[0]);
                                      widget.changeIndex(0);
                                    }),
                              ),
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList[1],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(widget.tabIconsList[1]);
                                      widget.changeIndex(1);
                                    }),
                              ),
                              SizedBox(
                                width: Tween(begin: 0.0, end: 1.0)
                                    .animate(CurvedAnimation(
                                    parent: animationController!,
                                    curve: Curves.fastOutSlowIn))
                                    .value *
                                    160.0,
                              ),
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList[2],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(widget.tabIconsList[2]);
                                      widget.changeIndex(2);
                                    }),
                              ),
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList[3],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(widget.tabIconsList[3]);
                                      widget.changeIndex(3);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 8,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: SizedBox(
              width: 38 * 2.0,
              height: 56,
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.transparent,
                child: SizedBox(
                  width: 38 * 2.0,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                          parent: animationController!,
                          curve: Curves.fastOutSlowIn)),
                      child: Container(
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2633C5),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFF2633C5),
                                HexColor("#6A88E5"),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          ),
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: const Color(0xFF2633C5)
                                    .withOpacity(0.4),
                                offset: const Offset(8.0, 16.0),
                                blurRadius: 16.0),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white.withOpacity(0.1),
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => newProspectScreen()));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    setState(() {
      for (var tab in widget.tabIconsList) {
        tab.isSelected = false;
        if (tabIconData.index == tab.index) {
          tab.isSelected = true;
        }
      }
    });
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key? key, required this.tabIconData, required this.removeAllSelect})
      : super(key: key);

  final TabIconData? tabIconData;
  final Function()? removeAllSelect;

  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData?.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) return;
        widget.removeAllSelect!();
        widget.tabIconData?.animationController?.reverse();
      }
    });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData?.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.tabIconData!.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                      parent: widget.tabIconData!.animationController!,
                      curve: const Interval(0.1, 1.0, curve: Curves.fastOutSlowIn)),
                  ),
                  child: Image.asset(widget.tabIconData!.isSelected
                      ? widget.tabIconData!.selectedImagePath
                      : widget.tabIconData!.imagePath,
                   ),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                        parent: widget.tabIconData!.animationController!,
                        curve:
                        const Interval(0.2, 1.0,
                            curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2633C5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                        parent: widget.tabIconData!.animationController!,
                        curve:
                        const Interval(0.5, 0.8,
                            curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2633C5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                        parent: widget.tabIconData!.animationController!,
                        curve:
                        const Interval(0.5, 0.6, curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2633C5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});
  final double radius;
  @override
  Path getClip(Size size) {
    final Path path = Path();

    final v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}