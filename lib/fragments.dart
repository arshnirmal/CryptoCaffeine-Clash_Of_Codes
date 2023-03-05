import 'package:defi/crypto_home_page.dart';
import 'package:defi/providers/market_provider.dart';
import 'package:defi/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/color.dart';
import 'constants/mediaQueryConstants.dart';

class Fragment extends StatefulWidget {
  const Fragment({super.key});

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late Provider cryptoProvider;
  int currIndex = 0;

  List<Widget> listOfScreens = [
    const Homepage(),
    Container(
      child: const Text('Home'),
    ),
    Container(
      child: const Text('Home'),
    ),
    const CryptoHomePage()
  ];
  List<IconData> listOfTags = const [
    Icons.home,
    Icons.track_changes,
    Icons.add,
    Icons.cabin,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: listOfScreens.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: listOfScreens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          width: widthFunc(
            context,
          ),
          decoration: BoxDecoration(
            color: backgroundWhite,
            borderRadius: BorderRadius.circular(32.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: listOfTags.map((e) {
              return GestureDetector(
                onTap: () {
                  tabController.animateTo(listOfTags.indexOf(e));
                  setState(() {});
                },
                child: Icon(
                  e,
                  size: 36,
                  color: const Color.fromARGB(255, 86, 48, 211),
                ),
              );
            }).toList(),
          )),
    );
  }
}
