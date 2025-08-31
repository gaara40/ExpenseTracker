import 'package:flutter/cupertino.dart';

const Color appPrimaryColor = Color(0xFF2979FF);

LinearGradient blueGradient = LinearGradient(
  colors: [
    appPrimaryColor.withValues(alpha: 0.3),
    appPrimaryColor.withValues(alpha: 0.1),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
