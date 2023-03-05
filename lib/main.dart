import 'package:defi/controllers/theme_controller.dart';
import 'package:defi/controllers/walletconnect_controller.dart';
import 'package:defi/providers/market_provider.dart';
import 'package:defi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
        ChangeNotifierProvider<WalletConnectController>(
          create: (_) => WalletConnectController(),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (_) => ThemeController(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGeneratedRoute,
      ),
    );
    // MaterialApp(
    //   onGenerateRoute: onGeneratedRoute,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   debugShowCheckedModeBanner: false,
    // );
  }
}
