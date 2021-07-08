import 'package:flutter/material.dart';

final backgroundColorApp = LinearGradient(
  colors: [
    const Color(0xFF22326B),
    const Color(0xFF110F20),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final primaryColor = Color(0xFF22326B);

final textTitle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 34,
  fontFamily: 'Roboto ',
);

final textCategories = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 24,
  fontFamily: 'Roboto ',
);

final textSpanTitle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w700,
  fontFamily: 'Robot ',
);

final textSpanSubtitle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  fontFamily: 'Robot',
  color: Colors.white.withOpacity(.87),
);

final bandTitle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Robot',
  color: Colors.white.withOpacity(.60),
);

final timeStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  fontFamily: 'Robot',
  color: Colors.white.withOpacity(.60),
);
