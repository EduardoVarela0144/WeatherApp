import 'package:example_class/Api/services.dart';
import 'package:example_class/components/weather_display.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCity = 'London';
  dynamic weatherData;

  final List<String> cities = ['London', 'New York', 'Paris', 'Tokyo'];

  final apiService = ApiService();

  LocationData? _locationData;
  Location location = Location();

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> fetchData(String lat, String lon) async {
    final data = await apiService.fetchDataByLocation(lat, lon);
    setState(() {
      weatherData = data;
    });
  }

  Future<void> _getLocation() async {
    try {
      final locationData = await location.getLocation();
      setState(() {
        _locationData = locationData;
      });
      fetchData(_locationData!.latitude.toString(),
          _locationData!.longitude.toString());
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener la ubicación: $e');
    }
  }

  void updateSelectedCity(String newCity) {
    selectedCity = newCity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Mi ciudad'),
      // ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home.jpeg'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  weatherData == null
                      ? const CircularProgressIndicator()
                      : WeatherDisplay(weatherData: weatherData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
