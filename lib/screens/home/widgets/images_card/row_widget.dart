import 'package:flutter/material.dart';
import 'package:indaband_app/components/text_span_widget.dart';

class RowWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String band;
  final String picture;
  const RowWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.band,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 6,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                picture,
                width: 208,
                height: 230,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 56,
                width: 208,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF000000).withOpacity(0),
                      Color(0xFF000000),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_circle),
                    ),
                    TextSpanWidget(
                      title: title,
                      subtitle: band,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
