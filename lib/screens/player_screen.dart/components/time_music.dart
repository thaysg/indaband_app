import 'package:flutter/material.dart';
import 'package:indaband_app/components/constants.dart';

class TimeMusic extends StatelessWidget {
  final String initialValue;
  final String finalValue;
  const TimeMusic({
    Key? key,
    required this.initialValue,
    required this.finalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          initialValue,
          style: timeStyle,
        ),
        Text(
          finalValue,
          style: timeStyle,
        ),
      ],
    );
  }
}
