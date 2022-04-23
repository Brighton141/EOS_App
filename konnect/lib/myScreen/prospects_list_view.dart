import 'package:konnect/app_theme.dart';
import 'package:konnect/main.dart';
import 'package:flutter/material.dart';
import 'package:konnect/models/prospects_list_data.dart';

import '../../main.dart';

class ProspectsListView extends StatefulWidget {
  const ProspectsListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _ProspectsListViewState createState() => _ProspectsListViewState();
}

class _ProspectsListViewState extends State<ProspectsListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<ProspectsListData> prospectListData = ProspectsListData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 2 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: 216,
                width: double.infinity,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 16, left: 16),
                  itemCount: prospectListData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final int count = prospectListData.length> 10 ? 10 : prospectListData.length;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn)));
                    animationController?.forward();

                    return ProspectsView(
                      prospectsListData: prospectListData[index],
                      animation: animation,
                      animationController: animationController!,
                    );
                  },
                ),
              ),
            ),
          );
      },
    );
  }
}

class ProspectsView extends StatelessWidget {
  const ProspectsView(
      {Key? key, this.animationController, this.animation, this.prospectsListData})
      : super(key: key);

  final ProspectsListData? prospectsListData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                10 * (1.0 - animation!.value), 0.0, 0.0),
              child: SizedBox(
                width: 130,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32, left: 8, right: 8, bottom: 16),
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.purpleAccent,
                                  offset: Offset(1.1, 4.0),
                                  blurRadius: 8.0),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purple,
                                Colors.indigo,
                              ]
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(54.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 54, left: 16, right: 16, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    prospectsListData!.titleTxt,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      letterSpacing: 0.2,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          prospectsListData!.prospects!.join('\n'),
                                          style: const TextStyle(
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            letterSpacing: 0.2,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                prospectsListData?.weeks != 0
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            prospectsListData!.weeks.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              letterSpacing: 0.2,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                              'weeks',
                                              style: TextStyle(
                                                fontFamily:
                                                    AppTheme.fontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                letterSpacing: 0.2,
                                                color: AppTheme.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: AppTheme.nearlyWhite,
                                          shape: BoxShape.circle,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: AppTheme.nearlyBlack
                                                    .withOpacity(0.4),
                                                offset: const Offset(8.0, 8.0),
                                                blurRadius: 8.0),
                                          ],
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.purple,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            color: AppTheme.nearlyWhite.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(prospectsListData!.imagePath),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }
}

