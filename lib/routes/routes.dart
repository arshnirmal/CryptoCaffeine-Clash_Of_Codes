import 'package:defi/screens/auth.dart';
import 'package:defi/screens/homepage.dart';
import 'package:defi/screens/portfolio.dart';
import 'package:flutter/material.dart';

Route? onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const Portfolio());
    default:
      return null;
  }
}
