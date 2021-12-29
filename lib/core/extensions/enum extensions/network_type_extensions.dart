import '../../enum/http_types.dart';

extension NetworkTypeExtensions on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
      case HttpTypes.POST:
        return "POST";
      default:
        throw "ERROR TYPE";
    }
  }
}
