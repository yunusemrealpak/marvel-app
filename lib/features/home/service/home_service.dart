import 'package:marvel_app/features/home/model/character.dart';
import 'package:marvel_app/features/home/repository/home_repository.dart';

class HomeService {
  late HomeRepository repo;
  
  HomeService() {
    repo = HomeRepository();
  }
  
  Future<List<Character>> getCharacters({int page = 0}) async {
    List<Character> characters = [];
    var response = await repo.getCharacters(page: page);
    
    if(response != null && response["data"] != null ) {
      var data = response["data"];
      var list = data["results"];
      
      if(list != null) {
        characters = (list as List).map((e) => Character.fromJson(e)).toList();
      }
    } 
    
    return characters;
  }
}