import 'package:flutter/cupertino.dart';

const Color appPrimaryColor = Color(0xFF2979FF);

//Chart Background Gradient Color
LinearGradient chartBackgroundGradient = LinearGradient(
  colors: [
    appPrimaryColor.withValues(alpha: 0.3),
    appPrimaryColor.withValues(alpha: 0.1),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

//Overalys Background Gradient Color
LinearGradient overlayBackgroundGradient = LinearGradient(
  colors: [
    appPrimaryColor.withValues(alpha: 0.9),
    appPrimaryColor.withValues(alpha: 0.6),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
