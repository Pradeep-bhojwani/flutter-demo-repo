import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LatLngScreen extends StatefulWidget {
  const LatLngScreen({super.key});

  @override
  State<LatLngScreen> createState() => _LatLngScreenState();
}

class _LatLngScreenState extends State<LatLngScreen> {
  List<Map<String, dynamic>> apiData = [
    {
      "roadMapItemId": 59,
      "latitudeLongitude": "-23.561732,-46.655978",
      "singleGoogleAddressNames":
          "Avenida Paulista,1578,Bela Vista,São Paulo,SP,01310200"
    },
    {
      "roadMapItemId": 60,
      "latitudeLongitude": "23.1935,72.6346",
      "singleGoogleAddressNames": null,
    },
    {
      "roadMapItemId": 69,
      "latitudeLongitude": "231935,726346",
      "singleGoogleAddressNames": "Rua Augusta,2203,Consolação,São Paulo,SP,01413000",
    },

    {
      "roadMapItemId": 55,
      "latitudeLongitude": "-2319.35,-7263.46",
      "singleGoogleAddressNames": "Rua Augusta,2203,Consolação,São Paulo,SP,01413000",
    },
    {
      "roadMapItemId": 60,
      "latitudeLongitude": "-23.553028,-46.659886",
      "singleGoogleAddressNames":
          "Rua Augusta,2203,Consolação,São Paulo,SP,01413000"
    },
    {
      "roadMapItemId": 61,
      "latitudeLongitude": null, // Invalid lat/lng
      "singleGoogleAddressNames":
          "Rua Oscar Freire,1057,Jardim Paulista,São Paulo,SP,01426001"
    },
    {
      "roadMapItemId": 62,
      "latitudeLongitude": "-23.572881,-46.682543",
      "singleGoogleAddressNames":
          "Avenida Brigadeiro Faria Lima,2232,Jardim Paulistano,São Paulo,SP,01451000"
    },
    {
      "roadMapItemId": 63,
      "latitudeLongitude": null, // Invalid lat/lng
      "singleGoogleAddressNames":
          "Rua Haddock Lobo,595,Cerqueira César,São Paulo,SP,01414001"
    }
  ];

  List<Map<String, dynamic>> latLngArray = [];

  @override
  void initState() {
    super.initState();
    getLatLngForAddresses(apiData); // Start fetching lat/long for addresses
  }

  // Helper to check if the latitude/longitude is valid
  bool isLatLngValid(String? latLng, int index) {
  if (latLng == null || !latLng.contains(',')) {
    print('Invalid lat/long at index $index: $latLng (Missing comma)');
    return false;
  }

  var parts = latLng.split(',');
  if (parts.length == 2) {
    // Check if both latitude and longitude contain a dot
    if (!parts[0].contains('.') || !parts[1].contains('.')) {
      print('Invalid lat/long at index $index: $latLng (Missing dot in lat or long)');
      return false;
    }

    try {
      double.parse(parts[0]);
      double.parse(parts[1]);
      return true;
    } catch (e) {
      print('Invalid lat/long at index $index: $latLng (Parsing error)');
      return false;
    }
  }

  print('Invalid lat/long at index $index: $latLng (Incorrect format)');
  return false;
}


  Future<void> getLatLngForAddresses(List<Map<String, dynamic>> data) async {
  for (int i = 0; i < data.length; i++) {
    String? latLngString = data[i]['latitudeLongitude'];
    Map<String, dynamic>? latLng;

    // Validate latitude/longitude and use index for error reporting
    if (isLatLngValid(latLngString, i)) {
      // Extract latitude and longitude from latitudeLongitude
      var latLngParts = latLngString!.split(',');
      latLng = {
        'latitude': latLngParts[0],
        'longitude': latLngParts[1],
      };

      // Get the city using reverse geocoding
      String? city = await getCityFromLatLng(latLngParts[0], latLngParts[1]);
      latLng['city'] = city; // Add city to latLng object
    } else {
      // Fallback to using singleGoogleAddressNames to fetch from Nominatim
      String? address = data[i]['singleGoogleAddressNames'];
      if (address != null) {
        latLng = await getLatLngFromNominatim(address);
      }
    }

    if (latLng != null) {
      latLngArray.add(latLng); // Add the lat/long (or address) to array
    }
  }
  setState(() {}); // Rebuild UI after lat/long is fetched
}


  Future<String?> getCityFromLatLng(String latitude, String longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var address = data['address'];
      return address['city'] ??
          address['town'] ??
          address['village']; // Fallback to different levels
    }
    return null; // Return null if the request failed
  }

  Future<Map<String, dynamic>?> getLatLngFromNominatim(String address) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$address&format=json&addressdetails=1&limit=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        var location = data[0];
        return {
          'latitude': location['lat'],
          'longitude': location['lon'],
          'city': location[
              'display_name'], // This can include the city in the display name
        };
      }
    }
    return null; // Return null if the request failed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lat/Long with City'),
      ),
      body: ListView.builder(
        itemCount: latLngArray.length,
        itemBuilder: (context, index) {
          var latLng = latLngArray[index];
          return ListTile(
            title: Text(
                'City: ${latLng['city'] ?? 'Unknown'}, Lat: ${latLng['latitude']}, Lng: ${latLng['longitude']}'),
          );
        },
      ),
    );
  }
}
