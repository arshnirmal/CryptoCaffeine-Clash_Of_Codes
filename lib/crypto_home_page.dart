import 'package:defi/models/Cryptocurrency.dart';
import 'package:defi/providers/market_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Crypto Today",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Consumer<MarketProvider>(
                  builder: (context, marketProvider, child) {
                    if (marketProvider.isLoading == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (marketProvider.markets.length > 0) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: marketProvider.markets.length,
                          itemBuilder: (context, index) {
                            CryptoCurrency currentCrypto =
                                marketProvider.markets[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    NetworkImage(currentCrypto.image!),
                              ),
                              title: Text(currentCrypto.name!),
                            );
                          },
                        );
                      } else {
                        return Text("Data not found");
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
