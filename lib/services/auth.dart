import 'package:dio/dio.dart';

class Auth {
  final dio = Dio();
  login(username, password) async {
    var resp = await dio.post('http://127.0.0.1:5000/login',
        queryParameters: {"username": username, "password": password});
    return resp.data;
  }

  register(username, password) async {
    var resp = await dio.post('http://127.0.0.1:5000/register',
        queryParameters: {"username": username, "password": password});
    return resp.data;
  }
}
