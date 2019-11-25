// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019-10-20
// Time : 15:21

import 'package:flutter/material.dart';
import 'package:practise/ui/tab_navigator.dart';
import 'package:practise/widget/page_route_anim.dart';

class RouteName {
  static const tab = "/";
//  static const authentication = "authentication";
//  static const about = "about";
}

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.tab:
        return NoAnimRouteBuilder(TabNavigator());
//      case RouteName.authentication:
//        return NoAnimRouteBuilder(HomePage());
//      case RouteName.about:
//        return NoAnimRouteBuilder(SettingsPage());
      default:
        throw "Error! no such RouteName: ${settings.name}";
    }
  }
}
