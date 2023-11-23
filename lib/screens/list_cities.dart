import 'package:flutter/material.dart';

import '../Api/services.dart';
import '../components/city_dropdown.dart';
import '../components/weather_display.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  String selectedCity = 'Oaxaca';
  dynamic weatherData;
  String image = 'assets/images/oaxaca.jpeg';

  final List<String> cities = [
    'London',
    'New York',
    'Paris',
    'Tokyo',
    'Oaxaca'
  ];

  final apiService = ApiService();

  @override
  void initState() {
    super.initState();

    fetchData(selectedCity);
  }

  Future<void> fetchData(String city) async {
    final data = await apiService.fetchData(city);
    setState(() {
      weatherData = data;
    });
    image = getBackgroundImage();
  }

  void updateSelectedCity(String newCity) {
    selectedCity = newCity;
  }

  String getBackgroundImage() {
    switch (selectedCity) {
      case 'London':
        return 'assets/images/london.jpeg';
      case 'New York':
        return 'assets/images/new_york.jpeg';
      case 'Paris':
        return 'assets/images/paris.jpeg';
      case 'Tokyo':
        return 'assets/images/tokyo.jpeg';
      case 'Oaxaca':
      default:
        return 'assets/images/oaxaca.jpeg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Ciudades'),
      // ),
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              getBackgroundImage(),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.7),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  weatherData == null
                      ? const CircularProgressIndicator()
                      : WeatherDisplay(weatherData: weatherData),
                  const SizedBox(height: 20.0),
                  CityDropdown(
                      cities: cities,
                      selectedCity: selectedCity,
                      fetchData: fetchData,
                      updateSelectedCity: updateSelectedCity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
