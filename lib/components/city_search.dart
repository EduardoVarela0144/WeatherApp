import 'package:flutter/material.dart';

class BuildCitySearch extends StatefulWidget {
  final TextEditingController cityController;
  final Function(String) fetchData;

  const BuildCitySearch({
    Key? key,
    required this.cityController,
    required this.fetchData,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BuildCitySearchState createState() => _BuildCitySearchState();
}

class _BuildCitySearchState extends State<BuildCitySearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextField(
                      controller: widget.cityController,
                      decoration: const InputDecoration(
                          labelText: 'Buscar ciudad',
                          hintText: 'Ingrese una ciudad',
                          labelStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10)),
                      style: const TextStyle(color: Colors.black)))),
        ),
        IconButton(
          color: Colors.white,
          icon: const Icon(Icons.search),
          onPressed: () {
            final enteredCity = widget.cityController.text.trim();
            widget.fetchData(enteredCity);
          },
        ),
      ],
    );
  }
}
