import 'package:dio/dio.dart';

class ApiServiceRequester {
  ApiServiceRequester({
    required this.dio,
  });

  final Dio dio;

  //get request
  Future<Response> getRequest({
    required String url,
  }) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/' + url,
    );

    return response;
  }
}
