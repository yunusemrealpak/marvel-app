import 'package:marvel_app/core/base/base_viewmodel.dart';
import 'package:marvel_app/core/enum/route_enum.dart';
import 'package:marvel_app/core/enum/types.dart';
import 'package:marvel_app/features/home/model/character.dart';
import 'package:marvel_app/features/home/service/home_service.dart';

class HomeViewModel extends BaseViewModel {
  static const int ItemRequestThreshold = 25;
  
  HomeService service = HomeService();
  List<Character> characters = [];
  
   int _currentPage = 1;
  
  init() async {
    setState(ViewState.Busy);
    characters = await service.getCharacters();
    setState(ViewState.Idle);
  }
  
  moreCharacters() async {
    var newCharacters = await service.getCharacters(page: _currentPage);
    characters.addAll(newCharacters);
    saveChanges();
  }

  goToDetails(Character character) {
    nvgSrv!.navigateTo(Routes.DETAIL.name, arguments: character);
  }

  handleItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = (itemPosition ~/ ItemRequestThreshold)+1;
    
    print("itemPosition : $itemPosition");
    print("requestMoreData : $requestMoreData");
    print("pageToRequest : $pageToRequest");

    if (requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest;
      await moreCharacters();
    }
  }
}