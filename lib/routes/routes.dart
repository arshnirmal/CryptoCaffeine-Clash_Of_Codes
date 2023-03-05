import 'package:defi/crypto_home_page.dart';
import 'package:defi/fragments.dart';
import 'package:defi/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route? onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const AuthPage());
    case '/fragments':
      return MaterialPageRoute(builder: (context) => const Fragment());
    case '/trade':
      return MaterialPageRoute(builder: (context) => const CryptoHomePage());
    default:
      return null;
  }
}
