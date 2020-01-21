import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_flow/model/splash_model.dart';
import 'package:login_flow/services/screen_ratio.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SizeConfig sizeConfig = SizeConfig();
  Completer _completer = new Completer();

  wait() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      _completer.complete();
    });
  }

  checkLogin() async {
    if (!_completer.isCompleted) await _completer.future;
    Navigator.of(context).pushReplacementNamed("/SignUp");
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
