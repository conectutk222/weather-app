import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'getlocation.dart';
import 'dart:convert';
import 'package:weather_app/Screens/All_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String key = 'd6c257cfbdf8f6b921da52b7f493ba63';

class lodingscreen extends StatefulWidget {
  const lodingscreen({Key? key}) : super(key: key);

  @override
  State<lodingscreen> createState() => _lodingscreenState();
}

class _lodingscreenState extends State<lodingscreen> {
  void weatherdata() async {
    try {
      Position position = await getlocation();
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$key&units=metric'));
      final data = jsonDecode(response.body);
      String condition = data['weather'][0]['main'];
      if (condition == 'Clear' || condition == 'Dust' || condition == 'Sand') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SunnyWeather(data, condition)));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => rainyweather(data, condition)));
      }
    } catch (e) {
      print('errrr');
    }
  }

  @override
  void initState() {
    weatherdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      color: Colors.cyan,
    );
  }
}
class cityloading extends StatefulWidget {
  String city;
  cityloading(this.city);

  @override
  State<cityloading> createState() => _cityloadingState();
}
class _cityloadingState extends State<cityloading> {
  void weatherdatabycity(String city) async {
    try{
    Response cityresponse = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=metric'));
    final data = jsonDecode(cityresponse.body);
    String condition = data['weather'][0]['main'];
    if (condition == 'Clear' || condition == 'Dust' || condition == 'Sand') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SunnyWeather(data, condition)));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => rainyweather(data, condition)));
    }}catch(e){
      print(e);
    }

  }
  @override
  void initState() {
    weatherdatabycity(widget.city);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      color: Colors.white,
    );
 }
}


