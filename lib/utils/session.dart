import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  static Map<String, String> headers = {};

  static Future<Map> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  static Future<Map> post(String url, dynamic data) async {
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  static void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
