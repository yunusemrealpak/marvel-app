import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_app/core/enum/env_enum.dart';

import '../enum/http_types.dart';
import '../extensions/enum%20extensions/network_type_extensions.dart';
import 'i_core_dio.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<dynamic> fetchNetwork(
    String path, {
    required HttpTypes type,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    
    // Marvel Authorization
    
    var apiKey = dotenv.get(EnvEnum.PUBLIC_KEY.name);
    var privateKey = dotenv.get(EnvEnum.PRIVATE_KEY.name);
    var ts = DateTime.now().millisecondsSinceEpoch.toString();
    
    var input = ts+privateKey+apiKey;
    
    var hash = md5.convert(utf8.encode(input)).toString();
    
    if(queryParameters == null) queryParameters = <String, dynamic>{};
    
    queryParameters["hash"] = hash;
    queryParameters["ts"] = ts;
    queryParameters["apikey"] = apiKey;
    
    try {
      final Response<dynamic> response = await request(
        path,
        data: data,
        options: Options(method: type.rawValue),
        queryParameters: queryParameters,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          return response.data;
        default:
          return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future fetchPrimitive(
    String path, {
    HttpTypes? type,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response<dynamic> response = await request(
        path,
        data: data,
        options: Options(method: type!.rawValue),
        queryParameters: queryParameters,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          return response.data;
        default:
          return null;
      }
    } catch (e) {
      return null;
    }
  }
}
