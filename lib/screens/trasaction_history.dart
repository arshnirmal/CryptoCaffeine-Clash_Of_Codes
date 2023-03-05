import 'package:defi/models/Cryptocurrency.dart';
import 'package:defi/providers/market_provider.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  TransactionHistory(
      {super.key,
      required this.currency,
      required this.amount,
      required this.status});
  String currency;
  double amount;
  String status;
  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // MarketProvider().fetchData().then(
    //       (value) => value.contains(widget.currency),
    //     );
  }

  String dataa = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: Color.fromARGB(192, 0, 0, 0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.currency,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    widget.status,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_rounded),
                    Text(" Transaction History"),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee"),
                      Text("0.0733"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total"),
                      // Text("XTZ 64.2213"),
                      Text(widget.currency +
                          " " +
                          (widget.amount + 0.0733).toStringAsFixed(2))
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rate"),
                      Text("XTZ 15.42045=AVAX 1.00"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time"),
                      Text("August 8, 2022 13:33"),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.content_copy_rounded),
                  Text("ID:" + "LBERDR-MYNO1-XLQk7"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
