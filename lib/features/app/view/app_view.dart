import 'package:flutter/material.dart';
import 'package:marvel_app/core/base/base_view.dart';
import 'package:marvel_app/features/app/viewmodel/app_viewmodel.dart';
import 'package:marvel_app/features/home/view/home_view.dart';

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  List<Widget> views = [HomeView(), SizedBox(), SizedBox()];
  
  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      viewModel: AppViewModel(),
      builder: (context, model, _) => Scaffold(
        body: views[model.selectedIndex],
      ),
    );
  }
}