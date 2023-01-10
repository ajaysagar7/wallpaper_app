import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wallpaper_app_2023/src/repositories/Dio%20Client/api_constants.dart';

class DioClient {
  Dio dio = Dio()
    ..options.baseUrl = ApiConstants.basicUrl
    ..options.connectTimeout = ApiConstants.connectionTimeOut
    ..options.receiveTimeout = ApiConstants.receiveTimeOut
    ..options.contentType = 'Application/json';

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  // Future<Response> get(
  //   String uri, {
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     var response = await dio.get(
  //       uri,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response;
  //   } on SocketException catch (e) {
  //     throw SocketException(e.toString());
  //   } on FormatException catch (_) {
  //     throw FormatException("Unable to process the data");
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}
