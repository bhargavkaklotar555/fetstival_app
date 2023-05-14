import 'dart:async';
import 'package:fetstival_app/utils/routes.dart';
import 'package:flutter/material.dart';

class Splash_Screen_Page extends StatefulWidget {
  const Splash_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Screen_Page> createState() => _Splash_Screen_PageState();
}

class _Splash_Screen_PageState extends State<Splash_Screen_Page> {
  void MySplash() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.home);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    MySplash();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Spacer(),
          Image.asset("assets/images/logo.png"),
          Spacer(),
          CircularProgressIndicator(),
          Spacer(),
        ],
      )),
    );
  }
}
