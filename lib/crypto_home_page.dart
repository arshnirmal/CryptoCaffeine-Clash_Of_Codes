import 'package:defi/constants/constants.dart';
import 'package:defi/models/Cryptocurrency.dart';
import 'package:defi/providers/market_provider.dart';
import 'package:flutter/material.dart';

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: whiteColorStyle(18).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Crypto Today",
                style: whiteColorStyle(18).copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder<List>(
                  future: MarketProvider().fetchData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      // if (snapshot.markets.length > 0) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          CryptoCurrency currentCrypto = snapshot.data?[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  NetworkImage(currentCrypto.image!),
                            ),
                            title: Text(currentCrypto.name!),
                            subtitle: Text(
                              currentCrypto.symbol!.toUpperCase(),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹ ${currentCrypto.currentPrice!.toStringAsFixed(2)}",
                                  style: const TextStyle(
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
                                        currentCrypto.priceChangePercentage24h!;
                                    if (pricechange < 0) {
                                      //-ve
                                      return Text(
                                        "${pricechangePercentage.toStringAsFixed(2)}%(${pricechange.toStringAsFixed(2)})",
                                        style:
                                            const TextStyle(color: Colors.red),
                                      );
                                    } else {
                                      //+ve
                                      return Text(
                                        "+${pricechangePercentage.toStringAsFixed(2)}%(+${pricechange.toStringAsFixed(2)})",
                                        style: const TextStyle(
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
                      // } else {
                      // return const Text("Data not found");
                      // }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 96,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
