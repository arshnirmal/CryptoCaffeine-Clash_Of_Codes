import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class API {
  static Future<List<dynamic>> getMarkets() async {
    try {
      Uri requestPath = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false");
      print('response');
      print(requestPath);
      Response response = await http.get(requestPath);
      print('object2');
      print(response);
      var decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);
      List<dynamic> markets = decodedResponse as List<dynamic>;
      print(markets.length);
      return markets;
    } catch (ex) {
      return [];
    }
  }
}
