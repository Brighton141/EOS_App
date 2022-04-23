
import 'package:konnect/models/tabIcon_data.dart';
import 'package:flutter/material.dart';
import 'package:konnect/bottom_navigation_view/bottom_bar_view.dart';
import 'package:konnect/screens/prospectsListView.dart';
import 'package:konnect/screens/repaymentScreen.dart';
import 'app_theme.dart';
import 'myScreen/my_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    tabBody = MyScreen(animationController: animationController);
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
        if (index == 0 || index == 1) {
          animationController?.reverse().then<dynamic>((data) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const prospectsListView()));
          });
        } else if (index == 2 || index == 3) {
          animationController?.reverse().then<dynamic>((data) {
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

