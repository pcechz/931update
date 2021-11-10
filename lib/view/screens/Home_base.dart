import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/Transaction.dart';
import 'package:creditswitch/view/screens/home_screen.dart';
import 'package:creditswitch/view/screens/wallet_screen.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class HomeBase extends StatefulWidget {
  @override
  _HomeBaseState createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  int _currentIndex = 0;
  List _screens = [
    HomeScreen(),
    Transaction(),
    HomeScreen(),
    WalletScreen(),
    WalletScreen()
  ];
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: white,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: greenColor,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 20,
        unselectedLabelStyle: TextStyle(fontSize: 11),
        selectedLabelStyle: TextStyle(fontSize: 11),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Transactions",
            icon: ImageIcon(
              AssetImage("assets/transactionbar.png"),
            ),
          ),
          BottomNavigationBarItem(
            label: "Services",
            icon: ImageIcon(
              AssetImage("assets/servicesbar.png"),
            ),
          ),
          BottomNavigationBarItem(
            label: "Wallet",
            icon: ImageIcon(
              AssetImage("assets/walletbar.png"),
            ),
          ),
          BottomNavigationBarItem(
            label: "Notifications",
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
