import 'dart:ui';

import 'package:flutter/material.dart';

class BlurLoading extends StatelessWidget {
  final EdgeInsets? padding;
  const BlurLoading({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
            ),
          ),
        ),
      ),
    );
  }
}
