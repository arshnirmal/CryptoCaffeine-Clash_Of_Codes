import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class API {
  static Future<List<dynamic>> getMarkets() async {
    try {
      Uri requestPath = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=gecko_desc&per_page=20&page=1&sparkline=false",
        // "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false",
      );
      print('response');
      print(requestPath);
      Response response = await http.get(requestPath);
      print('object2');
      print(response);
      var decodedResponse = jsonDecode(response.body);

      List<dynamic> markets = decodedResponse as List<dynamic>;
      return markets;
    } catch (ex) {
      return [];
    }
  }
}
