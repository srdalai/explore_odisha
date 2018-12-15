import 'package:expolre_odisha/data/data.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  final PlaceData place;
  PlaceDetails(this.place);

  @override
  Widget build(BuildContext context) {
    final String deg = '\u{00B0}';

    Widget _appBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      );
    }

    Widget _title() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              place.title.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.cloud_queue,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "17${deg}C",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )
            ],
          )
        ],
      );
    }

    return new Scaffold(
        body: GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails d) {
        print(d.delta.dx);
        if (d.delta.dx > 0) {
          Navigator.pop(context);
        }
      },
      child: Stack(
        children: <Widget>[
          Hero(
              tag: place.title,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                //decoration: BoxDecoration(image: DecorationImage(image: AssetImage(place.image), fit: BoxFit.cover)),
                child: Image(image: AssetImage(place.image), fit: BoxFit.cover),
              )),
          Container(
              color: Colors.black.withOpacity(0.3),
              child: Column(
                children: <Widget>[
                  _appBar(),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Column(
                        children: <Widget>[
                          _title(),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            place.description,
                            //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac mollis nisl, nec laoreet diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin laoreet libero in lacus consectetur consequat at sed ipsum. Etiam rutrum erat mauris, a vulputate urna mollis in. Mauris lectus est, vulputate et ipsum eu, efficitur blandit odio',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 200.0),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text("Navigate"),
                          )
                        ],
                      ))
                ],
              ))
        ],
      ),
    ));
  }
}
