import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_weather/services/location.dart';
import 'package:ocean_weather/services/networking.dart';
import 'location_screen.dart';


const apiKey = '2946fdad69fc70f4e3a043f999e3981a';


class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState(){
    super.initState();
    getLocationData();
    print("blaze");
  }


  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();


    Networker networker = Networker('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}'
        '&appid=$apiKey&units=metric');

    var weatherData = await networker.getData();
    
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,
      );
    }));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [SpinKitDoubleBounce(
          color: Colors.orange,
          size: 100,
        ),
          Text('Please wait while I get the weather')
        ]),
    );

  }
}


