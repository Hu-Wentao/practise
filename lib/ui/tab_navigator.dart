// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019-11-25
// Time : 20:16

import 'package:flutter/material.dart';
import 'package:practise/ui/home_page.dart';

List<Widget> pages = <Widget>[
  // todo
  HomePage()
];

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            if (_lastPressed == null ||
                DateTime.now().difference(_lastPressed) >
                    const Duration(seconds: 1)) {
              _lastPressed = DateTime.now();
              return false;
            }
            return true;
          },
          child: PageView.builder(
            itemBuilder: (ctx, index) => pages[index],
            itemCount: pages.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home), title: Text("主页")),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings), title: Text("设置"))
//              BottomNavigationBarItem(
//                  icon: const Icon(Icons.person),
//                  title: Text(S.of(context).tabMy)),
            ],
            currentIndex: _selectedIndex,
            onTap: (i) {
              _pageController.jumpToPage(i);
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
