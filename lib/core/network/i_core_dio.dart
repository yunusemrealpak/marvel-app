import '../enum/http_types.dart';

abstract class ICoreDio {
  Future<dynamic> fetchNetwork(
    String path, {
    required HttpTypes type,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
