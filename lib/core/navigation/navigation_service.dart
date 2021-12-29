import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService? instance;
  
  factory NavigationService() {
    if(instance == null) instance = NavigationService._init();
    
    return instance!;
  }
  
  NavigationService._init();

  final navigatorMainKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments, GlobalKey<NavigatorState>? navigatorKey}) {
    if(navigatorKey == null) return navigatorMainKey.currentState!.pushNamed(routeName, arguments: arguments);
    else return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplacement(String routeName, {dynamic arguments, GlobalKey<NavigatorState>? navigatorKey}) {
    if(navigatorKey == null) return navigatorMainKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    else return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  void goBack({dynamic arguments, GlobalKey<NavigatorState>? navigatorKey}) {
     if(navigatorKey == null) navigatorMainKey.currentState!.pop(arguments);
     else navigatorKey.currentState!.pop(arguments);
  }

  goBackUntil(String routeName, {dynamic arguments, GlobalKey<NavigatorState>? navigatorKey}) {
     if(navigatorKey == null) navigatorMainKey.currentState!.popUntil(ModalRoute.withName(routeName));
     else navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}