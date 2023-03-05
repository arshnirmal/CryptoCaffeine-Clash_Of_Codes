import 'package:defi/controllers/walletconnect_controller.dart';
import 'package:defi/fragments.dart';
import 'package:defi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with WidgetsBindingObserver {
  bool balRefresh = false;
  final TextEditingController _textCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<WalletConnectController>().initWalletConnect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    WalletConnectController controller =
        context.read<WalletConnectController>();
    DateFormat dateFormat = DateFormat("HH:mm:ss");
    String dateString = dateFormat.format(DateTime.now());
    logger.d("$dateString AppLifecycleState: ${state.toString()}.");
    if (state == AppLifecycleState.resumed && mounted) {
      // If we have a configured connection but the websocket is down try once to reconnect
      if (controller.walletConnect.connected &&
          !controller.walletConnect.bridgeConnected) {
        print(controller.walletConnect.connected);
        print(controller.walletConnect.bridgeConnected);
        logger.w(
            '$dateString  Wallet connected, but transport is down.  Attempt to recover.');
        controller.walletConnect.reconnect();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Remove observer for app lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    WalletConnectController controller =
        context.watch<WalletConnectController>();
    return controller.account == null
        ? Auth(controller: controller)
        : const Fragment();
  }
}

class Auth extends StatelessWidget {
  const Auth({
    super.key,
    required this.controller,
  });

  final WalletConnectController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: SvgPicture.asset(
                    "assets/illustrations/login.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                "Login to your wallet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: SizedBox(
                  width: 192,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.createWalletConnectSession(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 32,
                          width: 32,
                          child: SvgPicture.asset(
                            "assets/illustrations/metamask.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text(
                          "MetaMask",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
