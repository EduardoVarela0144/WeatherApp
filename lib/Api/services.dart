import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  String apiKey = '842c7d0d2eb17e0b255286e3314942a5';

  Future<Map<String, dynamic>> fetchData(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  Future<Map<String, dynamic>> fetchDataByLocation(
      String lat, String lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Error al cargar datos');
    }
  }
}
