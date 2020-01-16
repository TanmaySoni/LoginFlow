import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_flow/services/screen_ratio.dart';
import 'package:login_flow/services/shared_prefrences.dart';
import 'package:login_flow/ui/home_page/index.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SizeConfig sizeConfig = SizeConfig();
  Completer _completer = new Completer();

  bool isLoggedIn = false;

  wait() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      _completer.complete();
    });
  }

  checkLogin() async {
    isLoggedIn = await SharedPrefService.getIsLoggedIn();
    if (!_completer.isCompleted) await _completer.future;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: "demo",
          ),
        ),
      );
    } else {}
  }

  @override
  void initState() {
    super.initState();
    wait();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    sizeConfig.setReferenceWidthAndHeight(375, 812);

    return Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
