import 'dart:async';
import 'dart:developer';
import 'package:defi/models/API.dart';
import 'package:defi/models/Cryptocurrency.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> _markets = await API.getMarkets();
    // List<String> favorites = await LocalStorage.fetchFavorites();

    List<CryptoCurrency> temp = [];
    for (var market in _markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJson(market);

      // if(favorites.contains(newCrypto.id!)) {
      //   newCrypto.isFavorite = true;
      // }

      temp.add(newCrypto);
    }

    markets = temp;
    isLoading = false;
    notifyListeners();
  }
}
