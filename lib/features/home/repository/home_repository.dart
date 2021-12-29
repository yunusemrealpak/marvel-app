import 'package:marvel_app/core/base/base_repository.dart';
import 'package:marvel_app/core/enum/http_types.dart';
import 'package:marvel_app/core/network/network_paths.dart';

class HomeRepository extends BaseRepository {
  Future getCharacters({int page = 0, int limit = 30}) async {
    return await coreDio!.fetchNetwork(
      NetworkPaths.GET_CHARACTERS,
      type: HttpTypes.GET,
      queryParameters: {
        "offset": page*limit,
        "limit": limit,
      }
    );
  }
}
