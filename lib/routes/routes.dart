import 'package:flutter/material.dart';
import 'package:login_flow/ui/screens/home_page/index.dart';
import 'package:login_flow/ui/screens/signup.dart/index.dart';
import 'package:login_flow/ui/screens/splash/index.dart';

class Routes {
  static final routesList = <String, WidgetBuilder>{
    "/": (BuildContext context) => Splash(),
    "/myHomePage": (BuildContext context) => MyHomePage(),
    "/SignUp": (BuildContext context) => SignUp(),
  };
}
