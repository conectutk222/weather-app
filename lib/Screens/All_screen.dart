import 'package:flutter/material.dart';
import 'package:weather_app/Screens/TemplateScreen.dart';
class SunnyWeather extends StatelessWidget {
  final dynamic data;
  final String conditions;
  SunnyWeather(this.data, this.conditions);
  @override
  Widget build(BuildContext context) {
    return TemplateWeatherScreen(
      weatherAsset: 'IconImages/4102326_cloud_sun_sunny_weather_icon.png',
      weatherConditions: conditions,
      gradientColors: [Color(0xffFFFF8F), Color(0xffFBB482), Color(0xffF09052)],
      tileColor: Color(0xffFDE0C9),
      dataa: data,
    );
  }
}
class rainyweather extends StatelessWidget {
  final dynamic data;
  final String conditions;
  rainyweather(this.data, this.conditions);
  @override
  Widget build(BuildContext context) {
    return TemplateWeatherScreen(
      weatherAsset: 'IconImages/rain-weather-svgrepo-com.png',
      weatherConditions: conditions,
      gradientColors: [
        Color(0xffcaf0f8),
        Color(0xffade8f4),
        Color(0xff90e0ef),
        Color(0xff00b4d8)
      ],
      tileColor: Color(0xffade8f4),
      dataa: data,
    );
  }
}

class searchScreen extends StatelessWidget {
  late String newcity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC8FFD4),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.search,
            color: Color(0xfff4845f),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xfffF7CAD0),
                Color(0xffFF99AC),
                Color(0xffff4d6d)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (value) {
                    newcity = value;
                  },
                  cursorColor: Color(0xffFF0A54),
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Enter city name}',
                      suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.pop(context,newcity);
                        },
                        icon: Icon(
                          Icons.search_sharp,
                          size: 30,
                          color: Color(0xffFF477E),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffFF7096),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffFF5C8A),
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
