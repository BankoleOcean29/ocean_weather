import 'package:flutter/material.dart';
import 'package:ocean_weather/views/screen_to_load.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
      ),
      home: LoadingScreen(),
    );
  }
}