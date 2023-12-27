import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.urlString);

  String urlString;

  Future<dynamic> getData() async {
    var url = Uri.parse(urlString);
    print(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else
      print(response.statusCode);

    return null;
  }
}
