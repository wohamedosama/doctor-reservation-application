import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeader();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzY3ODkyOTM3LCJleHAiOjE3Njc5NzkzMzcsIm5iZiI6MTc2Nzg5MjkzNywianRpIjoiOGVzYkladVBZNXc4cDhVNSIsInN1YiI6IjYwMTAiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-H_lvewym6eQ9aGL81xdCm_hsyZj5f_rhBQD7zEqXbQ'
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
      ),
    );
  }
}
