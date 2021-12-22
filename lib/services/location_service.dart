import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationServiceMe {
  final String key = 'AIzaSyBcLDtw2sx8D0pZHkRMF0fXR-mFeIDa6AA';
  Future<String> getPlacedId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeid = json['candidates'][0]['place_id'] as String;
    // ignore: avoid_print
    // print(placeid);
    return placeid;
  }

  Future<Map<String, dynamic>> getplace(String input) async {
    final placeid = await getPlacedId(input);
    final String url =
        'http://maps.googleapis.com/maps/api/place/details/josn?place_id=$placeid&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;
    // ignore: avoid_print
    print(result);
    return result;
  }
}
//https://maps.googleapis.com/maps/api/place/autocomplete/json?
//