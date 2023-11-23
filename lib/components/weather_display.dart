import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherDisplay extends StatefulWidget {
  final dynamic weatherData;

  const WeatherDisplay({Key? key, required this.weatherData}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WeatherDisplayState createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    final cityName = widget.weatherData['name'];
    final description = widget.weatherData['weather'][0]['description'];
    final temperature =
        (widget.weatherData['main']['temp'] - 273.15).toStringAsFixed(2);

    String getDescriptionImage() {
      switch (widget.weatherData['weather'][0]['description']) {
        case 'clear sky':
          return 'assets/animations/clear_sky.json';
        case 'few clouds':
          return 'assets/animations/few_clouds.json';

        case 'scattered clouds':
          return 'assets/animations/scattered_cloudsjson';

        case 'broken clouds':
          return 'assets/animations/broken_clouds.json';

        case 'rain':
          return 'assets/animations/rain.json';

        case 'moderate rain':
          return 'assets/animations/rain.json';
        case 'shower rain':
          return 'assets/animations/shower_rain.json';

        case 'thunderstorm':
          return 'assets/animations/thunderstorm.json';

        case 'snow':
          return 'assets/animations/snow.json';

        default:
          return 'assets/animations/mist.json';
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          description,
          style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white),
        ),
        Lottie.asset(
          getDescriptionImage(),
        ),
        Text(
          cityName,
          style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextLiquidFill(
            text: 'Temperatura: $temperature°C',
            waveColor: Colors.blue,
            boxBackgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 80.0,
          ),
        )
      ],
    );
  }
}
