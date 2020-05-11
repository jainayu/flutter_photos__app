import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/unsplash.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future<Unsplash> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var j = json.decode('{"photos": ${response.body} }');
      return Unsplash.fromJson(j);
    } else {
      print(response.statusCode);
    }
  }
}
