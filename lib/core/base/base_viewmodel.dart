
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/core/navigation/navigation_service.dart';

import '../enum/types.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext? context;

  NavigationService? nvgSrv = NavigationService();

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  ViewState _pageState = ViewState.Idle;
  ViewState get pageState => _pageState;

  ViewState _productState = ViewState.Idle;
  ViewState get productState => _productState;

  bool disposed = false;

  setContext(BuildContext context) => this.context = context;

  setState(ViewState state) {
    _state = state;
    if (!disposed) notifyListeners();
  }

  setPageState(ViewState state) {
    _pageState = state;
    if (!disposed) notifyListeners();
  }

  setProductState(ViewState state) {
    _productState = state;
    if (!disposed) notifyListeners();
  }
  
  saveChanges(){
    if (!disposed) notifyListeners();
  }
  
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
