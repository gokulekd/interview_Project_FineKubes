import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_interview/constants/api.dart';

class ApiEndPoint {
  final dio = Dio(BaseOptions(responseType: ResponseType.plain, baseUrl: baseUrl));

  Future<Response<dynamic>?> getData() async {
    try {
      final dataReciver = await dio.get("");
    //  log(dataReciver.toString());

      return dataReciver;
    } catch (e) {
     log(e.toString());
    }
    return null;
  }
}
