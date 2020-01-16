import 'package:flutter/material.dart';
import 'package:login_flow/routes/routes.dart';
import 'package:login_flow/utils/theme_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routes: Routes.routesList,
      initialRoute: "/",
    );
  }
}
