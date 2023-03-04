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
              SizedBox(
                height: 20,
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
                          physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: marketProvider.markets.length,
                          itemBuilder: (context, index) {
                            CryptoCurrency currentCrypto =
                                marketProvider.markets[index];
                            return ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    NetworkImage(currentCrypto.image!),
                              ),
                              title: Text(currentCrypto.name!
                                  // "#" +
                                  // "${currentCrypto.marketCapRank!}"
                                  ),
                              subtitle: Text(
                                currentCrypto.symbol!.toUpperCase(),
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "₹ " +
                                        currentCrypto.currentPrice!
                                            .toStringAsFixed(2),
                                    style: TextStyle(
                                      color: Color(0xff0395eb),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      double pricechange =
                                          currentCrypto.priceChange24h!;
                                      double pricechangePercentage =
                                          currentCrypto
                                              .priceChangePercentage24h!;
                                      if (pricechange < 0) {
                                        //-ve
                                        return Text(
                                          "${pricechangePercentage.toStringAsFixed(2)}%(${pricechange.toStringAsFixed(2)})",
                                          style: TextStyle(color: Colors.red),
                                        );
                                      } else {
                                        //+ve
                                        return Text(
                                          "+${pricechangePercentage.toStringAsFixed(2)}%(+${pricechange.toStringAsFixed(2)})",
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
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
