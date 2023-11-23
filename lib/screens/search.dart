import 'package:flutter/material.dart';

import '../Api/services.dart';
import '../components/city_search.dart';
import '../components/weather_display.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String selectedCity = 'Oaxaca';
  dynamic weatherData;

  final TextEditingController _cityController = TextEditingController();

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
  }

  void updateSelectedCity(String newCity) {
    selectedCity = newCity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Encontrar ciudad'),
      // ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/earth.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildCitySearch(
                        cityController: _cityController, fetchData: fetchData),
                    const SizedBox(height: 20.0),
                    weatherData == null
                        ? const CircularProgressIndicator()
                        : WeatherDisplay(weatherData: weatherData),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
