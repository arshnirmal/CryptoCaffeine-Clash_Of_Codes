import 'dart:async';
import 'package:defi/models/API.dart';
import 'package:defi/models/Cryptocurrency.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  Future<List> fetchData() async {
    List<dynamic> markets = await API.getMarkets();
    // List<String> favorites = await LocalStorage.fetchFavorites();

    List<CryptoCurrency> temp = [];
    for (var market in markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJson(market);
      // if(favorites.contains(newCrypto.id!)) {
      //   newCrypto.isFavorite = true;
      // }
      temp.add(newCrypto);
    }

    markets = temp;
    isLoading = false;
    return markets;
  }
}
