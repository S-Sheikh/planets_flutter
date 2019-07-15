import 'package:flutter/material.dart';
import 'package:planet_flutter/ui/PlantetSummary.dart';
import 'package:planet_flutter/model/planet.dart';

class HomePageBody extends StatelessWidget {
      
 
  @override
  Widget build(BuildContext context) {
    // return new PlanetRow(planets[0]);
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate((context, index)=> 
                new PlanetSummary(planets[index])
                ,childCount: planets.length
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}