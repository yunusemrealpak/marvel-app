import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_app/core/enum/route_enum.dart';
import 'package:marvel_app/features/router.dart';

import 'core/navigation/navigation_service.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      navigatorKey: NavigationService().navigatorMainKey,
      initialRoute: Routes.APP.name,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
