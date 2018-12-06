import 'dart:async';
import 'dart:convert';

import 'package:expolre_odisha/data/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CitySelector extends StatefulWidget {
  @override
  _CitySelectorState createState() => new _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return CityCard(places[0]);
        },
      ),
    );
  }
}

class CityCard extends StatefulWidget {
  final PlaceData place;
  CityCard(this.place);
  @override
  _CityCardState createState() => new _CityCardState();
}

class _CityCardState extends State<CityCard> {

  final String deg = '\u{00B0}';
  List data;
  // static String cityID = "524901";
  static String cityID = "1275817";  //bhubaneswar
  static String api = 'a2cf88f959335cc6ddbce46a08700d6b'; 
  final forecastUrl = "http://api.openweathermap.org/data/2.5/forecast?id=$cityID&APPID=$api&units=metric";
  final weatherUrl = "http://api.openweathermap.org/data/2.5/weather?id=$cityID&APPID=$api&units=metric";

  int temp, tempMin, tempMax, humidity, visibility, sunrise, sunset;
  double pressure, speed, angle;
  String sky = "";
  DateTime sRise, sSet;

  Future<String> getData() async {
    var weatherResult = await http.get(Uri.encodeFull(weatherUrl), headers: {"Accept" : "application/json"});
    var forecastResult = await http.get(Uri.encodeFull(forecastUrl), headers: {"Accept" : "application/json"});
    var weatherBody = json.decode(weatherResult.body);
    var forecastBody = json.decode(forecastResult.body);
    data = forecastBody['list'];
    setState(() {
          temp = weatherBody['main']['temp'];
          tempMin = weatherBody['main']['temp_min'];
          tempMax = weatherBody['main']['temp_max'];
          humidity = weatherBody['main']['humidity'];
          pressure = weatherBody['main']['pressure']/1000;
          visibility = weatherBody['visibility'];
          sunrise = weatherBody['sys']['sunrise'];
          sunset = weatherBody['sys']['sunset'];
          speed = weatherBody['wind']['speed'];
          angle = weatherBody['wind']['angle'];
          sky = weatherBody['weather'][0]['main'];
          sRise = DateTime.fromMillisecondsSinceEpoch(sunrise*1000);
          sSet = DateTime.fromMillisecondsSinceEpoch(sunset*1000);
        });
    return "Success";
  }

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      this.getData();
    }

  @override
  Widget build(BuildContext context) {

    Widget _makeText(String data, {double size = 16.0, bool isBold = false, double letterSpacing, double wordSpacing}) {
      return Text(
        data,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing
        ),
      );
    }

    Widget _pill({IconData icon, String title, String data}) {
      return Container(
        padding: EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white, width: 3.0)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(icon, color: Colors.white, size: 40.0,),
                Text(title, style: TextStyle(color: Colors.white, fontSize: 20.0))
              ],
            ),
            SizedBox(width: 15.0,),
            Expanded(child: Text(data, style: TextStyle(color: Colors.white, fontSize: 27.0),)),
          ],
        )
      );
    }

    Widget _weatherData() {
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: _pill(
                  icon: Icons.blur_on,
                  title: "Humidity", 
                  data :"$humidity%"
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                  child: _pill(
                  icon: Icons.local_parking,
                  title: "Pressure", 
                  data :"${pressure.toStringAsFixed(1)} bar"
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Expanded(
                  child: _pill(
                  icon: Icons.file_upload,
                  title: "Sunrise", 
                  data :"${sRise.hour}:${sRise.minute} AM"
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                  child: _pill(
                  icon: Icons.file_download,
                  title: "Sunset", 
                  data :"${sSet.hour - 12}:${sSet.minute} PM"
                ),
              ),
            ],
          )
        ],
      );
    }

    Widget _content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _makeText(widget.place.title, isBold: true, size: 24.0, letterSpacing: 3.0),
              data == null ?Container() : _makeText(sky, size: 20.0),
              data == null ?Container() : _makeText("$temp$deg", size: 150.0),
              data == null ?Container() : _makeText("$tempMin$deg / $tempMax$deg", size: 22.0),
            ],
          ),
          data == null ? Container() : _weatherData(),
          data == null ? Container() : Flexible(child: WeatherRow(data))
        ],
      );
    }

    return Stack(
      children: <Widget>[
        Container(
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.place.image), fit: BoxFit.cover)),
          //child: Image(image: AssetImage(place.image), fit: BoxFit.cover),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue.withOpacity(0.2),
          child: _content(),
        ),
      ],
    );
  }
}

//Weather widget
class WeatherRow extends StatelessWidget {
  final List data;
  WeatherRow(this.data);
  
  final String deg = '\u{00B0}';

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: AlignmentDirectional.center,
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          int tempMin = (data[index]['main']['temp_min']).round();
          int tempMax = (data[index]['main']['temp_max']).round();
          if (index == 0) {
            return Container();
          }
          else if (GetDate(data[index]['dt_txt']).getDay() == GetDate(data[index - 1]['dt_txt']).getDay()) {
            return Container();
          }
          else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(GetDate(data[index]['dt_txt']).getWeekDay(), style: TextStyle(color: Colors.white),),
                  Icon(Icons.wb_sunny, color: Colors.white,),
                  Text("$tempMin$deg/$tempMax$deg", style: TextStyle(color: Colors.white),)
                ],
              ),
            );
          }
        },
      )
    );
  }
}

class GetDate {
  String date;
  GetDate(this.date);
  int getDay() {
    var dt = DateTime.parse(date);
    return dt.day;
  }

  int getMonth() {
    var dt = DateTime.parse(date);
    return dt.month;
  }

  String getWeekDay() {
    var dt = DateTime.parse(date);
    int wkd = dt.weekday;
    String weekday;
    switch (wkd) {
      case 1:
        weekday = "Mon";
        break;
      case 2:
        weekday = "Tue";
        break;
      case 3:
        weekday = "Wed";
        break;
      case 4:
        weekday = "Thu";
        break;
      case 5:
        weekday = "Fri";
        break;
      case 6:
        weekday = "Sat";
        break;
      case 7:
        weekday = "Sun";
        break;
    }
    return weekday;
  }
}