import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const TextWidget({
    Key? key,
    required this.title,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
