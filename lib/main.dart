import 'package:flutter/material.dart';
import 'package:planet_flutter/UI/GradientAppBar.dart';
import 'package:planet_flutter/UI/HomePageBody.dart';
import 'package:planet_flutter/ui/DetailPage.dart';

void main() {
  // Routes.initRoutes();
  
  runApp(new MaterialApp(
    title: "Planets",
    home: new HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Treva"),
          new HomePageBody(),
        ],
      ),
    );
  }
}


