
import 'package:flutter/material.dart';
import 'package:konnect/app_theme.dart';
import 'package:konnect/screens/headers/nprspctHeader.dart';
import 'package:konnect/screens/headers/prospectListHeader.dart';
import 'package:konnect/screens/repaymentScreen.dart';

import '../bottom_navigation_view/bottom_bar_view.dart';
import '../models/tabIcon_data.dart';
import '../myScreen/my_screen.dart';

class prospectsListView extends StatefulWidget {
  const prospectsListView({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  _NewProspectListViewState createState() => _NewProspectListViewState();
}

class _NewProspectListViewState extends State<prospectsListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = prospectHeader(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: bottomBar(),
                      )
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
               Navigator.push(context,
               MaterialPageRoute(builder: (context) => const prospectsListView()));
              });
            } else if (index == 1 || index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted){
                  return;
                }
               Navigator.push(context,
               MaterialPageRoute(builder: (context) => const repaymentScreen()));
              });
            }
          },
        ),
      ],
    );
  }
}

