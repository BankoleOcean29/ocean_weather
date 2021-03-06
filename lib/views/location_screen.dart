import 'package:flutter/material.dart';
import 'package:ocean_weather/utilities/constants.dart';
import 'package:ocean_weather/services/weather.dart';

class LocationScreen extends StatefulWidget {

  final locationWeather;

  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temperature = 1;
  int condition = 1;
  String cityName = '';
  WeatherModel weather = WeatherModel();

  void updateUi(dynamic weatherData) {
    double temp  = weatherData['main']['temp'];
    temperature = temp.toInt();
    int condition = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];
    weather.getWeatherIcon(condition);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
    print(temperature);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/lagos.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature??',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '??????',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's ???? time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*double temperature = decodedData(data)['main']['temp'];
int condition = decodedData(data)['weather'][0]['id'];
String cityName = decodedData['name'];*/