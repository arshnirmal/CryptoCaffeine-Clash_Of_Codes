import 'dart:async';
import 'package:defi/models/API.dart';
import 'package:defi/models/Cryptocurrency.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];

  // MarketProvider() {
  //   fetchData();
  // }

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
    Timer(const Duration(seconds: 5), () {
      fetchData();
    });
    return markets;
  }

  // CryptoCurrency fetchCryptoById(String id) {
  //   CryptoCurrency crypto = markets.where((element) => element.id == id).toList()[0];
  //   return crypto;
  // }

  // void addFavorite(CryptoCurrency crypto) async {
  //   int indexOfCrypto = markets.indexOf(crypto);
  //   markets[indexOfCrypto].isFavorite = true;
  //   await LocalStorage.addFavorite(crypto.id!);
  //   notifyListeners();
  // }

  // void removeFavorite(CryptoCurrency crypto) async {
  //   int indexOfCrypto = markets.indexOf(crypto);
  //   markets[indexOfCrypto].isFavorite = false;
  //   await LocalStorage.removeFavorite(crypto.id!);
  //   notifyListeners();
  // }
}
