import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_weather/constants.dart';
import 'package:simple_weather/utils/weather.dart';

class MainScreen extends StatefulWidget {
  MainScreen({@required this.weatherData});

  final WeatherData weatherData;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int temperature;
  Icon weatherDisplayIcon;
  AssetImage backgroundImage;
  String nameOfPlace, description;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
      nameOfPlace = weatherData.nameOfPlace;
      description = weatherData.description;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                Text(
                  '$temperature┬░',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                    letterSpacing: -2,
                  ),
                ),
                Text(
                  '$nameOfPlace',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                    letterSpacing: -2,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  '$description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
