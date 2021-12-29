import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/core/extensions/context_extensions.dart';
import 'package:marvel_app/features/home/model/character.dart';

class CharacterDetailsView extends StatefulWidget {
  final Character character;
  CharacterDetailsView({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterDetailsViewState createState() => _CharacterDetailsViewState();
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {
  late Character ch;

  @override
  void initState() {
    super.initState();
    ch = widget.character;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
          SliverToBoxAdapter(
            child: FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: EdgeInsets.all(context.customWidthValue(0.05)),
                child: Text(
                  ch.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.customWidthValue(0.055),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              delay: Duration(milliseconds: 150),
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: EdgeInsets.all(context.customWidthValue(0.05)),
                child: Text(
                  ch.description ?? "",
                  style: TextStyle(
                    fontSize: context.customWidthValue(0.038),
                    fontWeight: FontWeight.bold,
                    color: Colors.white30,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 50),
            sliver: SliverToBoxAdapter(
              child: FadeInUp(
              delay: Duration(milliseconds: 250),
              duration: Duration(milliseconds: 500),
                child: Text(
                  "Comics",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              delay: Duration(milliseconds: 250),
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100.0,
                      height: 100,
                      color: Colors.grey.shade600,
                      margin: context.paddingNormal,
                    );
                  },
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 50),
            sliver: SliverToBoxAdapter(
              child: FadeInUp(
              delay: Duration(milliseconds: 300),
              duration: Duration(milliseconds: 500),
                child: Text(
                  "Series",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              delay: Duration(milliseconds: 350),
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 250.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150.0,
                      height: 100,
                      color: Colors.grey.shade600,
                      margin: context.paddingNormal,
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 150,),
          )
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppbar() {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      title: Image.asset(
        "assets/logo/logo.png",
        fit: BoxFit.contain,
        height: 20,
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
      pinned: true,
      stretch: true,
      floating: true,
      expandedHeight: 350,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: widget.character.id!,
          child: CachedNetworkImage(
            imageUrl: widget.character.thumbnail!.path! + "." + widget.character.thumbnail!.extension!,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
