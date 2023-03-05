import 'dart:async';

import 'package:defi/screens/trade_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../constants/mediaQueryConstants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  List listOfIllustrations = [
    'assets/illustrations/ethereum.svg',
    'assets/illustrations/moneystats.svg',
  ];

  List listOfCrypto = [
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
    ['assets/illustrations/bitcoin_logo.svg', 'Bitcoin', 'BTC'],
    ['assets/illustrations/ethereum_logo.svg', 'Ethereum', 'BTC'],
    ['assets/illustrations/shiba_logo.svg', 'Shiba Inu', 'BTC'],
    ['assets/illustrations/solana_logo.svg', 'Solana', 'BTC'],
    ['assets/illustrations/binance_logo.svg', 'Binance Coin', 'BTC'],
  ];
  late Timer timer;
  late ScrollController scrollController;
  int index = 0;
  Tween<Offset> offset = Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, 0.08));
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat(reverse: true);
    ;
    super.initState();

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      }
      if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        index = index + 1;
        if (index == listOfIllustrations.length) {
          index = 0;
        }
      });
    });
    scrollController = ScrollController();
    scrollController.addListener(() {
      scrollController.animateTo(
        scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Container(
        child: SafeArea(
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48.0),
                      bottomRight: Radius.circular(48.0),
                    )),
                child: Column(
                  children: [
                    Container(
                      width: widthFunc(context),
                      alignment: Alignment.centerLeft,
                      child: SlideTransition(
                        position: offset.animate(CurvedAnimation(
                            parent: animationController, curve: Curves.easeIn)),
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person)),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SlideTransition(
                      position: offset.animate(CurvedAnimation(
                          parent: animationController, curve: Curves.easeIn)),
                      child: CircleAvatar(
                        radius: 0.35 * widthFunc(context),
                        backgroundColor: Colors.white,
                        child: FadeTransition(
                          opacity: const AlwaysStoppedAnimation(10.0),
                          child: SvgPicture.asset(
                            listOfIllustrations[index],
                            height: 0.2 * heightFunc(context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Welcome to TheFi",
                      style: whiteColorStyle(64.0).copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                        wordSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Hi Bhoomik",
                      style: whiteColorStyle(32.0).copyWith(shadows: [
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 5),
                            blurRadius: 30.0,
                            spreadRadius: 1.0),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, -5),
                            blurRadius: 30.0,
                            spreadRadius: 1.0),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(5, 0),
                            blurRadius: 30.0,
                            spreadRadius: 1.0),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, 0),
                            blurRadius: 30.0,
                            spreadRadius: 1.0),
                      ]),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: const Text(
                              '0xwefwwe.....4w9vw84e',
                              style: TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.copy,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Popular Crypto',
                style: whiteColorStyle(24.0),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                height: 0.35 * heightFunc(context),
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: listOfCrypto
                      .take(5)
                      .map((e) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TradeScreen(crypto: e);
                                  },
                                ),
                              );
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.black,
                                          child: SvgPicture.asset(
                                            listOfCrypto[
                                                listOfCrypto.indexOf(e)][0],
                                            height: 36,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e[1],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                              ),
                                              maxLines: 1,
                                            ),
                                            Text(
                                              listOfCrypto[
                                                  listOfCrypto.indexOf(e)][2],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 4.0),
                                              alignment: Alignment.bottomLeft,
                                              child: const Text(
                                                "Rs 189566",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Explore Crypto',
                style: whiteColorStyle(24.0),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32.0)),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                height: 0.50 * heightFunc(context),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Above 50 crypto",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: const Text(
                                'Explore',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      height: 0.35 * heightFunc(context),
                      child: GridView.count(
                        controller: scrollController,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 8.0,
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 3,
                        children: listOfCrypto
                            .map((e) => Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: SvgPicture.asset(
                                    e[0],
                                    height: 16,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 96,
              )
            ],
          ),
        ),
      ),
    );
  }
}
