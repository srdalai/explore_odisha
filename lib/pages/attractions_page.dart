import 'package:expolre_odisha/data/data.dart';
import 'package:expolre_odisha/pages/place_details.dart';
import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_coverflow/simple_coverflow.dart';

class AttractionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NewAppBar(
        context,
        titleTxt: 'Attractions',
      ),
      drawer: NewDrwaer(
        context,
        s2: true,
      ),
      body: CoverFlow(
        dismissibleItems: false,
        itemCount: places.length,
        itemBuilder: (context, int index) {
          return ItemCard(places[index]);
        },
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final PlaceData place;

  ItemCard(this.place);

  @override
  _ItemCardState createState() => new _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  Widget _topHalf(Orientation oriention) {
    bool potrait;
    if (oriention == Orientation.portrait) {potrait = true;} else {potrait = false;}
    return GestureDetector(
                onVerticalDragUpdate: (DragUpdateDetails d) {
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PlaceDetails(widget.place));
                  if (d.delta.dy < 0) {Navigator.push(context, route);}
                },
                child: Hero(
                  tag: widget.place.title,
                  child: potrait ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3,
                      child: Image.asset(widget.place.image, fit: BoxFit.cover) 
                    ): Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(widget.place.image,fit: BoxFit.cover),
                    ),
                  ),
              );
  }

  Widget _bottomHalf() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.place.title,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0,),
              Text(
                widget.place.description,
                //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac mollis nisl, nec laoreet diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin laoreet libero in lacus consectetur consequat at sed ipsum. Etiam rutrum erat mauris, a vulputate urna mollis in. Mauris lectus est, vulputate et ipsum eu, efficitur blandit odio',
                style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
      builder: (context, orientation){
        if(orientation == Orientation.portrait) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  _topHalf(orientation),
                  Flexible(child: SingleChildScrollView(child: _bottomHalf()))
                ],
              ),
            ),
          );
        }
        else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 10.0,
              child: Row(
                children: <Widget>[
                  _topHalf(orientation),
                  Flexible(child: SingleChildScrollView(child: _bottomHalf()))
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
