import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:on_boarding/features/google_map/const/consts.dart';

class PostalService {
  static Future<String?> getAddressFromZip(String zipCode) async {
    // Google Geocoding API ekhane bhalo kaj kore postal code-er jonno
    final String url = 
        "https://maps.googleapis.com/maps/api/geocode/json?address=$zipCode&key=$GoogleMapAPIKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          // Prothom result er formatted address ta niyo
          return data['results'][0]['formatted_address'];
        }
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}