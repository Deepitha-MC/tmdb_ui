import 'package:dio/dio.dart';

class Auth {
  final dio = Dio();
  login(username, password) async {
    var resp = await dio.post('http://localhost:5000/login',
        queryParameters: {"username": username, "password": password});
    print(resp.data);
    return resp.data;
  }

  register(username, password) async {
    var resp = await dio.post('http://localhost:5000/register',
        queryParameters: {"username": username, "password": password});
    print(resp.data);
    return resp.data;
  }
}
