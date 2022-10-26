import 'package:flutter/material.dart';
import 'All_screen.dart';
import 'package:weather_app/backend/getweatherdata.dart';
class TemplateWeatherScreen extends StatefulWidget {
  final String weatherAsset;
  final dataa;
  final String weatherConditions;
  final List<Color> gradientColors;
  final Color tileColor;
  TemplateWeatherScreen(
      {required this.weatherAsset,
      required this.weatherConditions,
      required this.gradientColors,
      required this.tileColor,
      this.dataa});
  @override
  State<TemplateWeatherScreen> createState() => _TemplateWeatherScreenState();
}

class _TemplateWeatherScreenState extends State<TemplateWeatherScreen> {
  late String newcity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC8FFD4),
        leading: IconButton(
          onPressed: () async {
            newcity = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => searchScreen()),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => cityloading(newcity),
              ),
            );
          },
          icon: Icon(
            Icons.search,
            color: Color(0xfff4845f),
          ),
        ),

        title:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
              onPressed: () async {
                newcity = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lodingscreen()),
                );
              },
              icon: Icon(
                Icons.location_on,
                color: Color(0xfff4845f),
              ),
        ),
            ],
          ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 15, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.dataa['name'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 40),
                      ),
                    ),
                    Text(
                      'Tue,October,18',
                      style: TextStyle(fontSize: 25, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          widget.weatherAsset,
                          height: 150,
                          width: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dataa['main']['temp'].toStringAsFixed(1),
                              style: TextStyle(fontSize: 80),
                            ),
                            Text(
                              widget.weatherConditions,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 70),
                          child: Text(
                            '°C',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ForeCastTile(
                      leadingIcon: Icons.cloudy_snowing,
                      title: 'Rainfall',
                      trailing: '${widget.dataa['clouds']['all'].toString()}%',
                      color: widget.tileColor,
                    ),
                    ForeCastTile(
                        title: 'Windspeed',
                        leadingIcon: Icons.air,
                        trailing:
                            '${widget.dataa['wind']['speed'].toString()}km/h',
                        color: widget.tileColor),
                    ForeCastTile(
                      title: 'Humidity',
                      leadingIcon: Icons.water_drop,
                      trailing:
                          '${widget.dataa['main']['humidity'].toString()}%',
                      color: widget.tileColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForeCastTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String trailing;
  final Color color;
  ForeCastTile(
      {required this.title,
      required this.leadingIcon,
      required this.trailing,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        color: color,
        child: ListTile(
          leading: Icon(leadingIcon),
          title: Text(title),
          trailing: Text(trailing),
        ),
      ),
    );
  }
}
