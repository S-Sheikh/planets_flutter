import 'package:flutter/material.dart';
import 'package:planet_flutter/model/planet.dart';
import 'package:planet_flutter/style/styles.dart';
import 'package:planet_flutter/ui/DetailPage.dart';

class PlanetSummary extends StatelessWidget {
  //planet object that is passed to the row

  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet,{this.horizontal = true});
  
  PlanetSummary.vertical(this.planet): horizontal =false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 16.0,
    ),
    alignment:  horizontal ? FractionalOffset.centerLeft :FractionalOffset.center,
    child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: new Image(
        image: new AssetImage(planet.image),
        height: 92.0,
        width: 92.0,
      ),
    ),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black38,
          blurRadius: 3.0,
          offset: Offset(horizontal ? -100.0 : 0,horizontal ? 0.0 : -5.0),
        ),
        new AnimatedContainer(
          duration: 100,
          child: new BoxShadow(

          ),
        )
      ]
    ),
  );


  Widget _planetValue({String value, IconData icon}) {
      return new Row(
        children: <Widget>[
          new Icon(icon,color: Colors.white24,),
          new Container(width: 8.0),
          new Text(value, style: Styles.regularTextStyle),
        ]
      );
    }

  final planetCardContent = new Container(
    margin: new EdgeInsets.fromLTRB(horizontal?100.0:16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: <Widget>[
        new Container(height: 4.0,width: 8.0,),
        new Text(planet.name
        ,style:Styles.subHeaderTextStyle,),
        new Container(height: 5.0,),
        new Text(planet.location,style:Styles.subHeaderTextStyle),
        new Container(
          margin: new EdgeInsets.symmetric(vertical: 8.0),
          height: 3.0,
          width: 18.0,
          color: new Color(0xFF00C6FF),
        ),
        new Row(
          children: <Widget>[
            new Expanded(
              flex: horizontal ? 1 : 0,
              child: _planetValue(
                value: planet.distance,
                icon: Icons.location_on,
              ),
            ),
            new Expanded(
              flex: horizontal ? 1 : 0,
              child: _planetValue(
                value: planet.gravity,
                icon: Icons.arrow_drop_down,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  final planetCard = new Container(
    height: horizontal ? 124.0 : 154.0,
    margin: horizontal ? new EdgeInsets.only(left: 46.0) : new EdgeInsets.only(top:72.0),
    decoration: new BoxDecoration(
      gradient: new LinearGradient(     
        colors: [new Color(0xFF232366),new Color(0xFF31318C)],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        tileMode: TileMode.clamp,
      ),
      // color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black45,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        )
      ]
    ),
  );

  return new GestureDetector(
      onTap: horizontal ? () => Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (_, __, ___) => new DetailPage(planet),
        transitionsBuilder: (context,animation,secondaryAnimation,child)=>
        new FadeTransition(
          opacity: animation,
          child: child,
        )
      )) : null,
      child: Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,    
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          planetCard,
          planetThumbnail,
          planetCardContent,
        ],
      ),
    ),
  );

  
  } 
}