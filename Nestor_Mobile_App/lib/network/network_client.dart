import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/nothing.dart';
import '../util/request_type.dart';
import '../util/request_type_exception.dart';

class NetworkClient {
  //Base url
  static const String imageURL =
      '';
 // static const String _baseUrl = "";
 //  static const String _baseUrl = "http://192.168.43.240:5000";
  static const String _baseUrl = 'http://web.nestoronline.in/api';
  final Client _client;

  NetworkClient(this._client);

  Future<Response> request({
    @required RequestType requestType,
    @required String path,
    dynamic parameter = Nothing,
    String Temptoken,
  }) async {
    //  print(json.encode(parameter));
    print("$_baseUrl/$path");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    String token = prefs.getString('token') != null ? prefs.getString('token') : '' ;
    print(token);
    print('token: {$token}');
    switch (requestType) {
      case RequestType.GET:
        final response = await _client.get(
          "$_baseUrl/$path",
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token',

          },
        );
        print('token: {$HttpHeaders.authorizationHeader}');
        print(response);
        return response;
      case RequestType.POST:
        final response = await _client.post("$_baseUrl/$path",
            headers: {
              "Content-Type": "application/json",
              "Authorization": 'Bearer $token',
            },
            body: json.encode(parameter));
        //print(response);
        return response;
      case RequestType.DELETE:
        return _client.delete(
          "$_baseUrl/$path",
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token',
          },
        );

      case RequestType.PUT:
        final response = await _client.put("$_baseUrl/$path",
            headers: {
              "Content-Type": "application/json",
              "Authorization": 'Bearer $token',
            },
            body: json.encode(parameter));
        return response;
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }
}
