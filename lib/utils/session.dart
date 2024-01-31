import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  static Map<String, String> state = {};
  static Map<String, String> headers = {};

  static Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    updateHeader(response);
    return response;
  }

  static Future<dynamic> post(String url, dynamic data) async {
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: headers);
    updateHeader(response);
    return response;
  }

  static void updateHeader(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      List<String> cookies = rawCookie.split('; ');

      for (String cookie in cookies) {
        List<String> parts = cookie.split('=');
        String cookieName = parts[0];
        String cookieValue = parts.length > 1 ? parts[1] : '';
        state[cookieName] = cookieValue;
      }

      headers['Content-Type'] = "application/json";
      headers['Authorization'] = "Bearer ${state['token']}";
    }
  }
}
