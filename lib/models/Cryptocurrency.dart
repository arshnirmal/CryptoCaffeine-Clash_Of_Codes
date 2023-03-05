class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? priceChange24h;
  double? priceChangePercentage24h;

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
  });

  CryptoCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = double.parse(json['current_price'].toString());
    priceChange24h = double.parse(json['price_change_24h'].toString());
    priceChangePercentage24h =
        double.parse(json['price_change_percentage_24h'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    // data['market_cap'] = this.marketCap;
    // data['market_cap_rank'] = this.marketCapRank;
    // data['fully_diluted_valuation'] = this.fullyDilutedValuation;
    // data['total_volume'] = this.totalVolume;
    // data['high_24h'] = this.high24h;
    // data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    return data;
  }
}
