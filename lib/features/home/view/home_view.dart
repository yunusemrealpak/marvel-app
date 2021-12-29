import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marvel_app/core/base/base_loader.dart';
import 'package:marvel_app/core/base/base_view.dart';
import 'package:marvel_app/core/extensions/context_extensions.dart';
import 'package:marvel_app/core/extensions/string_extensions.dart';
import 'package:marvel_app/features/home/model/character.dart';
import 'package:marvel_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:marvel_app/features/widgets/creation_aware_list_item.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, _) => Scaffold(
        appBar: buildAppbar(),
        body: BaseLoader(
          state: model.state,
          child: StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(0),
            crossAxisCount: 1,
            controller: _scrollController,
            itemCount: model.characters.length,
            itemBuilder: (context, index) {
              var character = model.characters.elementAt(index);
              return FadeInUp(
                delay: Duration(milliseconds: 100),
                duration: Duration(milliseconds: (index * 50) + 800),
                child: GestureDetector(
                  onTap: () => model.goToDetails(character),
                  child: CreationAwareListItem(
                    itemCreated: () {
                      SchedulerBinding.instance!.addPostFrameCallback((duration) => model.handleItemCreated(index));
                    },
                    child: buildCharacterCard(character),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 0.8),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Icon(Icons.menu),
      title: Image.asset(
        "assets/logo/logo.png",
        fit: BoxFit.contain,
        height: 30,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }

  Widget buildCharacterCard(Character ch) {
    var visible = ch.thumbnail?.path?.isNotEmpty ?? false;
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (visible)
            Hero(
              tag: ch.id!,
              child: Container(
                width: double.infinity,
                height: context.customWidthValue(0.3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: ch.thumbnail!.path! + "." + ch.thumbnail!.extension!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              ch.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.customWidthValue(0.055),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              ch.description!.checkLength(50),
              style: TextStyle(
                fontSize: context.customWidthValue(0.038),
                fontWeight: FontWeight.bold,
                  color: Colors.white30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: FittedBox(
              child: Container(
                padding: context.paddingLow,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
