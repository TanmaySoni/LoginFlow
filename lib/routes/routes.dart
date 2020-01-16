import 'package:flutter/material.dart';
import 'package:login_flow/ui/home_page/index.dart';
import 'package:login_flow/ui/splash/index.dart';

class Routes {
  static final routesList = <String, WidgetBuilder>{
    "/": (BuildContext context) => Splash(),
    "/myHomePage": (BuildContext context) => MyHomePage(),
  };
}
