
import 'package:flutter/material.dart';
import 'package:marvel_app/core/enum/types.dart';

import '../../core/extensions/context_extensions.dart';
import 'blur_loading.dart';

class BaseLoader extends StatelessWidget {
  final Widget child;
  final ViewState state;
  final bool showTextArea;
  final String loaderText;
  const BaseLoader(
      {Key? key, required this.child, required this.state, this.showTextArea = false, this.loaderText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          child,
          Visibility(
            visible: state == ViewState.Busy,
            child: showTextArea
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: context.customWidthValue(0.7),
                      height: context.customWidthValue(0.3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularProgressIndicator.adaptive(),
                          Text(loaderText),
                        ],
                      ),
                    ),
                  )
                : BlurLoading(),
          ),
        ],
      ),
    );
  }
}
