import 'package:flutter/material.dart';
import 'package:indaband_app/components/text_span_widget.dart';

class MostPlayedWidget extends StatelessWidget {
  final String title;
  final String band;
  final VoidCallback onTap;
  final String picture;

  const MostPlayedWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.picture,
    required this.band,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  picture,
                  height: 160,
                  width: 160,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextSpanWidget(
          title: title,
          subtitle: band,
        ),
      ],
    );
  }
}
