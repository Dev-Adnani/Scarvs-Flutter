import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scarvs/app/routes/api.routes.dart';

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
  };

//User Sign Up
  Future createAccount(
      {required String useremail,
      required String username,
      required String userpassword}) async {
    const subUrl = '/auth/signup';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "useremail": useremail,
          "userpassword": userpassword,
          "username": username
        }));
    final dynamic body = response.body;
    return body;
  }

  Future userLogin(
      {required String useremail, required String userpassword}) async {
    const subUrl = '/auth/login';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "useremail": useremail,
          "userpassword": userpassword,
        }));
    final dynamic body = response.body;
    return body;
  }
}
