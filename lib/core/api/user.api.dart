import 'package:http/http.dart' as http;
import 'package:scarvs/app/routes/api.routes.dart';

class UserAPI {
  final client = http.Client();

  Future getUserData({required String token}) async {
    const subUrl = '/auth/verify';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': "*",
        "Authorization": "$token"
      },
    );
    final dynamic body = response.body;
    return body;
  }

  Future getUserDetails({required String userEmail}) async {
    var subUrl = '/info/$userEmail';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': "*",
      },
    );
    final dynamic body = response.body;
    return body;
  }
}
