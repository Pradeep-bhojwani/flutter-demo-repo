import 'dart:convert'; // Import if using JSON data
import 'package:flutter/material.dart';

class Validate extends StatefulWidget {
  const Validate({super.key});

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  // Sample data similar to the one you provided
  List<Map<String, dynamic>> apiData = [
    {
      "latitude": "-23561732",
      "longitude": "-46655978",
      "singleAddressNames": "Avenida Paulista, 1578, São Paulo, SP",
    },
    {
      "latitude": "-23.1935",
      "longitude": "-72.6346",
      "singleAddressNames": "Rua Oscar Freire, 1057, São Paulo, SP",
    },
    {
      "latitude": "-23193.5",
      "longitude": "-7263.6",
      "singleAddressNames": "Rua Oscar Freire, 1057, São Paulo, SP",
    },
    {
      "latitude": "-23553028",
      "longitude": "-46659886",
      "singleAddressNames": "Rua Augusta, 2203, São Paulo, SP",
    },
    {
      "latitude": "-invalidLat",
      "longitude": "-46665294",
      "singleAddressNames": "Rua Oscar Freire, 1057, São Paulo, SP",
    },
    {
      "latitude": "23.1935",
      "longitude": "72.6346",
      "singleAddressNames": "Rua Oscar Freire, 1057, São Paulo, SP",
    }
  ];

  List<String> validationResults = [];

  @override
  void initState() {
    super.initState();
    validateLatLngData();
  }

  // Validate latitude and longitude format
  bool isLatLngValid(String? latitude, String? longitude, int index) {
    if (latitude == null || longitude == null || !latitude.contains('.') || !longitude.contains('.')) {
      validationResults.add(
          "Invalid format at index $index: latitude or longitude does not contain a dot.");
      return false;
    }

    try {
      double lat = double.parse(latitude);
      double lng = double.parse(longitude);

      if (!isValidLatLang(lat, lng)) {
        validationResults.add(
            "Invalid lat/long at index $index: $latitude, $longitude is out of range.");
        return false;
      }

      // If valid, add a message indicating that
      validationResults.add(
          "Valid lat/long at index $index: $latitude, $longitude is within range.");
      return true;
    } catch (e) {
      validationResults.add(
          "Invalid format at index $index: latitude or longitude is not a valid number.");
      return false;
    }
  }

  // Function to check if lat and long are within valid ranges
  bool isValidLatLang(double latitude, double longitude) {
    return latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180;
  }

  // Method to perform validation on the provided data
  void validateLatLngData() {
    for (int i = 0; i < apiData.length; i++) {
      String? latitude = apiData[i]['latitude'];
      String? longitude = apiData[i]['longitude'];

      bool isValid = isLatLngValid(latitude, longitude, i);
    }
    setState(() {}); // Rebuild the UI with the validation results
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latitude/Longitude Validation'),
      ),
      body: ListView.builder(
        itemCount: validationResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(validationResults[index]),
          );
        },
      ),
    );
  }
}
