import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();
  Dio get dio => _dio;
}
