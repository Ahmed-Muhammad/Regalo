import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

//---------- Dio --> Initialization ------------

  static init() {
    String baseUrl = 'https://eltamiuz.net/regalo/api/';
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //----------------------------Post Data----------------------------------------
  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? firebaseToken,
  }) async {
    dio?.options.headers = {
      'content-type': 'application/json',
    };
    return await dio?.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

//----------------------------Get Data----------------------------------------
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    //لما اعوز احط headers
    //وبيلغوا اللي متعرفين فوق في dio

    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
