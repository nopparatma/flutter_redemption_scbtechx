import 'package:dio/dio.dart';

abstract class BaseService {
  var dio = Dio();

  Future get(String url, Function(dynamic data) returnCallback) async {
    var response = await dio.get(url);
    return returnCallback(response.data);
  }
}
