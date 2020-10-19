import 'package:flutter_app/widgets/locations.dart';
import 'package:http/http.dart' as http;

class Services {
  //

  static Future<List<Location>> getLocations(final id) async {
    // print(id);
    String url = 'https://b2db46bf69b0.ngrok.io/type/' + id.toString();
    // print(url);
    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (200 == response.statusCode) {
        // print(response.body + 'hello');
        // print(locationFromJson(response.body));
        final List<Location> locations = locationFromJson(response.body);
        // print(locations);
        return locations;
      } else {
        return List<Location>();
      }
    } catch (e) {
      return List<Location>();
    }
  }
}
