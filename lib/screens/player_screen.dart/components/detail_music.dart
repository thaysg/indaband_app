import 'package:flutter/material.dart';
import 'package:indaband_app/components/constants.dart';
import 'package:indaband_app/components/text_widget.dart';

class DetailMuscic extends StatelessWidget {
  const DetailMuscic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          title: 'Making A Fire',
          textStyle: textCategories,
        ),
        TextWidget(
          title: 'Foo Fighters',
          textStyle: bandTitle,
        ),
      ],
    );
  }
}
