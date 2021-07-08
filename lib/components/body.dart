import 'package:flutter/material.dart';

import 'constants.dart';

class BodyScreen extends StatelessWidget {
  final Widget myWidget;
  const BodyScreen({
    Key? key,
    required this.myWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: backgroundColorApp,
      ),
      child: myWidget,
    );
  }
}
