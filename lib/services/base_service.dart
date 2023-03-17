import 'package:dio/dio.dart';

abstract class BaseService {
  var dio = Dio();

  Future get(String url, Function(dynamic data) returnCallback) async {
    var response = await dio.get(url);
    return returnCallback(response.data);
  }

  Future post(String url, dynamic data, Function(dynamic data) returnCallback, {Map<String, dynamic>? headers, num countRepeat = 0}) async {
    headers = headers ?? {};

    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
            ...headers,
          },
        ),
      );
    } catch (e) {
      if (e is DioError && e.response != null && e.response?.statusCode != 200 && countRepeat < 3) {
        countRepeat += 1;
        return post(url, data, returnCallback, headers: headers, countRepeat: countRepeat);
      }
      rethrow;
    }

    dynamic returnObj = returnCallback(response.data);

    return returnObj;
  }
}
