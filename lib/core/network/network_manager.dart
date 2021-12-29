import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_app/core/enum/env_enum.dart';

import 'core_dio.dart';
import 'i_core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;
  ICoreDio? callCenterDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: dotenv.get(EnvEnum.BASE_URL.name),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );

    coreDio = CoreDio(baseOptions);
  }
}
