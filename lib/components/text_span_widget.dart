import 'package:flutter/material.dart';

import 'constants.dart';

class TextSpanWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const TextSpanWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: textSpanTitle,
        children: [
          TextSpan(
            text: subtitle,
            style: textSpanSubtitle,
          ),
        ],
      ),
    );
  }
}
