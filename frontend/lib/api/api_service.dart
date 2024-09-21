import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService{
    Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
        String url = "http://backend:8000/login/login";

        final response = await http.post(url, body: requestModel.toJson());
        if (response.statusCode == 200) {
            return PostModel.fromJson(json.decode(response.body));
        }
         else {
            throw Exception('Failed');
        }
    }
}