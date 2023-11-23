import 'package:flutter/material.dart';

import '../Api/services.dart';

class CityDropdown extends StatefulWidget {
  final String selectedCity;
  final List<String> cities;
  final Function(String) fetchData;

  final Function(String) updateSelectedCity;

  const CityDropdown(
      {Key? key,
      required this.cities,
      required this.selectedCity,
      required this.fetchData,
      required this.updateSelectedCity})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: widget.selectedCity,
          items: widget.cities.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            widget.updateSelectedCity(newValue!);
            widget.fetchData(newValue);
          },
        ));
  }
}
