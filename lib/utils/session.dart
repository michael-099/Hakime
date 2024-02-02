import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  static Map<String, String> state = {};
  static Map<String, dynamic> cache = {};
  static Map<String, String> headers = {"Content-Type": "application/json"};
  // static Map<String, String> headers = {};

  static Future<dynamic> login(String url, dynamic data) async {
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: headers);
    dynamic body = jsonDecode(response.body);
    String token = body["token"];
    Map<String, dynamic> user = body["user"];
    cache["user"] = user;
    state["userId"] = body["user"]["id"];
    state["token"] = token;
    headers["Authorization"] = "Bearer $token";
    return response;
  }

  static Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    cache["getData $url"] = response.body;
    return response;
  }

  static Future<dynamic> post(String url, dynamic data) async {
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: headers);
    cache["postData $url"] = response.body;
    print("response from session post ${response.body}");
    return response;
  }

  static Future<dynamic> put(String url, dynamic data) async {
    http.Response response = await http.put(Uri.parse(url),
        body: jsonEncode(data), headers: headers);
    cache["postData $url"] = response.body;
    print("response from session put ${response.body}");
    return response;
  }
}
