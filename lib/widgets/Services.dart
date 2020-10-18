import 'package:flutter_app/widgets/locations.dart';
import 'package:http/http.dart' as http;

class Services {
  //

  static Future<List<Location>> getLocations(final id) async {
    // print(id);
    String url = 'https://f6bfdc60dbdd.ngrok.io/type/' + id.toString();
    // print(url);
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Location> locations = locationFromJson(response.body);
        return locations;
      } else {
        return List<Location>();
      }
    } catch (e) {
      return List<Location>();
    }
  }
}
