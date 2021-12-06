import 'package:dio/dio.dart';

class DioHelpper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
    ));
  }
}
