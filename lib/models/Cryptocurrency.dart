class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  // int? marketCap;
  double? marketCapRank;
  // int? fullyDilutedValuation;
  // int? totalVolume;
  // int? high24h;
  // int? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  // double? marketCapChange24h;
  // double? marketCapChangePercentage24h;
  // int? circulatingSupply;
  // int? totalSupply;
  // int? maxSupply;
  // int? ath;
  // double? athChangePercentage;
  // String? athDate;
  // double? atl;
  // double? atlChangePercentage;
  // String? atlDate;
  // Null? roi;
  // String? lastUpdated;

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    // required this.marketCap,
    required this.marketCapRank,
    // required this.fullyDilutedValuation,
    // required this.totalVolume,
    // required this.high24h,
    // required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    // required this.marketCapChange24h,
    // required this.marketCapChangePercentage24h,
    // required this.circulatingSupply,
    // required this.totalSupply,
    // required this.maxSupply,
    // required this.ath,
    // required this.athChangePercentage,
    // required this.athDate,
    // required this.atl,
    // required this.atlChangePercentage,
    // required this.atlDate,
    // required this.roi,
    // required this.lastUpdated,
  });

  CryptoCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = double.parse(json['current_price'].toString());
    // marketCap = json['market_cap'];
    marketCapRank = double.parse(['market_cap_rank'].toString());
    // fullyDilutedValuation = json['fully_diluted_valuation'];
    // totalVolume = json['total_volume'];
    // high24h = json['high_24h'];
    // low24h = json['low_24h'];
    priceChange24h = double.parse(json['price_change_24h'].toString());
    priceChangePercentage24h =
        double.parse(json['price_change_percentage_24h'].toString());
    // marketCapChange24h = json['market_cap_change_24h'];
    // marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    // circulatingSupply = json['circulating_supply'];
    // totalSupply = json['total_supply'];
    // maxSupply = json['max_supply'];
    // ath = json['ath'];
    // athChangePercentage = json['ath_change_percentage'];
    // athDate = json['ath_date'];
    // atl = json['atl'];
    // atlChangePercentage = json['atl_change_percentage'];
    // atlDate = json['atl_date'];
    // roi = json['roi'];
    // lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    // data['current_price'] = this.currentPrice;
    // data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;
    // data['fully_diluted_valuation'] = this.fullyDilutedValuation;
    // data['total_volume'] = this.totalVolume;
    // data['high_24h'] = this.high24h;
    // data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    // data['market_cap_change_24h'] = this.marketCapChange24h;
    // data['market_cap_change_percentage_24h'] =
    //     this.marketCapChangePercentage24h;
    // data['circulating_supply'] = this.circulatingSupply;
    // data['total_supply'] = this.totalSupply;
    // data['max_supply'] = this.maxSupply;
    // data['ath'] = this.ath;
    // data['ath_change_percentage'] = this.athChangePercentage;
    // data['ath_date'] = this.athDate;
    // data['atl'] = this.atl;
    // data['atl_change_percentage'] = this.atlChangePercentage;
    // data['atl_date'] = this.atlDate;
    // data['roi'] = this.roi;
    // data['last_updated'] = this.lastUpdated;
    return data;
  }
}
