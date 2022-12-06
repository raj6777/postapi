import 'package:http/http.dart' as http;
import 'package:post_api/network/ConstantApi.dart';

class ApiClient {
  String res = "";

  Future<String> login(String email, String password) async {
    var url = Uri.parse(ConstatApi.BaseUrl + ConstatApi.LoginEndPoint);
    var response = await http.post(url,
        body: (<String, String>{"email": email, "password": password}));
    if (response.statusCode == 200) {
      res = response.body.toString();
      return res;
    } else {
      return res;
    }
  }

  Future<String> register(String email, String password) async {
    var url = Uri.parse(ConstatApi.BaseUrl + ConstatApi.RegisterEndPoint);
    var response = await http.post(url,
        body: (<String, dynamic>{"email": email, "password": password}));

    if (response.statusCode == 200) {
      res = response.body.toString();
      return res;
    } else {
      return res;
    }
  }
}
