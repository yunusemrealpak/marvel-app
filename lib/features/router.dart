import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_app/core/enum/route_enum.dart';
import 'package:marvel_app/features/app/view/app_view.dart';
import 'package:marvel_app/features/home/model/character.dart';

import 'character_details/view/character_details_view.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name?.route) {
      case Routes.APP:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.APP.name),
          builder: (_) => AppView(),
        );
      case Routes.DETAIL:
        var ch = settings.arguments as Character;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.DETAIL.name),
          builder: (_) => CharacterDetailsView(character: ch),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
