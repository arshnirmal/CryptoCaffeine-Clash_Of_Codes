import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  dynamic crypto;
  TradeScreen({super.key, required this.crypto});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text('${widget.crypto[1]}'),
        centerTitle: true,
      ),
      body: Container(
        
      ),
    );
  }
}
