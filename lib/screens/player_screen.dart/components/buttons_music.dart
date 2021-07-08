import 'package:flutter/material.dart';

class ButtonsMusic extends StatelessWidget {
  final VoidCallback onTapRewind;
  final VoidCallback onTapPlay;
  final VoidCallback onTapForward;
  final IconData iconRewind;
  final IconData iconPlay;
  final IconData iconForward;
  final double sizeRewind;
  final double sizePlay;
  final double sizeForward;
  final Color backColor;
  final Color playColor;
  final Color forwardColor;
  const ButtonsMusic({
    Key? key,
    required this.onTapRewind,
    required this.onTapPlay,
    required this.onTapForward,
    required this.iconRewind,
    required this.iconPlay,
    required this.iconForward,
    required this.sizeRewind,
    required this.sizePlay,
    required this.sizeForward,
    required this.backColor,
    required this.playColor,
    required this.forwardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: IconButton(
              onPressed: onTapRewind,
              icon: Icon(
                iconRewind,
                size: sizeRewind,
                color: backColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: onTapPlay,
            icon: Icon(
              iconPlay,
              size: sizePlay,
              color: playColor,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: IconButton(
              onPressed: onTapForward,
              icon: Icon(
                iconForward,
                size: sizeForward,
                color: forwardColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final double size;
  const IconButtonWidget({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        iconData,
        size: size,
      ),
    );
  }
}
