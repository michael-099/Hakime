import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  static Map<String, String> state = {};
  static Map<String, dynamic> cache = {};
  static Map<String, String> headers = {"Content-Type": "application/json"};
  // static Map<String, String> headers = {};

  static Future<dynamic> login(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    cache["login $url"] = response.body;
    dynamic body = jsonDecode(response.body);
    String token = body["token"];

    state["userId"] = body["user"]["id"];
    state["token"] = token;
    headers["Authorization"] = "Bearer $token";
    return response;
  }

  static Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    cache["post $url"] = response.body;
    return response;
  }

  static Future<dynamic> post(String url, dynamic data) async {
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: headers);
    cache["post $url"] = response.body;
    return response;
  }
}
