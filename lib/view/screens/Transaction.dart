import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/Statistics.dart';
import 'package:creditswitch/view/screens/TransactionsAll.dart';
import 'package:creditswitch/view/screens/cashback.dart';
import 'package:creditswitch/view/screens/fund_wallet.dart';
import 'package:creditswitch/view/screens/wallet_history.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(29, 150, 210, 1),
        toolbarHeight: 120,
        title: Container(
          color: Color.fromRGBO(29, 150, 210, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Transactions',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Circular Std',
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.0555555555555556),
              ),
              Image.asset(
                'avatarprofile.png',
                height: 39.0,
                width: 38.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 18, top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 34,
                      height: 126,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                        color: Color.fromRGBO(29, 150, 210, 1),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 73,
                                    height: 126,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                      color: fa_color_secondary,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 23,
                                          right: 24,
                                          bottom: 48,
                                          top: 52),
                                      child: Image.asset(
                                        'trans1.png',
                                        height: 26.0,
                                        width: 26.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ]),
                            Padding(
                              padding: EdgeInsets.only(left: 21, top: 18),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Transaction Count',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    242, 242, 242, 1),
                                                fontFamily: 'Avenir Next',
                                                fontSize: 13,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1.5),
                                          ),
                                          Text(
                                            '210',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Avenir Next',
                                                fontSize: 22,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height:
                                                    1.5 /*PERCENT not supported*/
                                                ),
                                          ),
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Amount Spent',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    242, 242, 242, 1),
                                                fontFamily: 'Avenir Next',
                                                fontSize: 13,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1.5),
                                          ),
                                          Text(
                                            'N20, 600',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Avenir Next',
                                                fontSize: 22,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height:
                                                    1.5 /*PERCENT not supported*/
                                                ),
                                          ),
                                        ])
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 18, top: 14),
                      child: Container(
                          width: MediaQuery.of(context).size.width - 34,
                          height: 51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                            color: Color.fromRGBO(255, 235, 240, 1),
                          ),
                          child: ListTile(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Statistics();
                                }));
                              },
                              leading: Container(
                                child: Image.asset(
                                  'historychart.png',
                                  height: 23.0,
                                  width: 23.0,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              title: Text(
                                'How have I been Spending?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(235, 87, 87, 1),
                                    fontFamily: 'Avenir Next',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              ),
                              subtitle: Text(''),
                              trailing: Text(
                                '>',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(235, 87, 87, 1),
                                    fontFamily: 'Avenir Next',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )))),
                  Padding(
                    padding: EdgeInsets.only(top: 33),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 21),
                            child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                Text(
                              'Recent Transactions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(44, 164, 224, 1),
                                  fontFamily: 'Avenir Next',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.3571428571428572),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 21),
                            child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TransactionsAll();
                                }));
                              },
                              child: Text(
                                'See all',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(44, 164, 224, 1),
                                    fontFamily: 'Avenir Next',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.3571428571428572),
                              ),
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 21),
                              child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                  Text(
                                'Today',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                    fontFamily: 'Avenir Next',
                                    fontSize: 11,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                        leading: Container(child: Icon(Icons.money)),
                        onTap: () {
                          _bottomSheetMore(context);
                        },
                        title: Text(
                          'DSTV Premium to 2352432',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3571428571428572),
                        ),
                        subtitle: Text(
                          '- N20,000',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3571428571428572),
                        ),
                        trailing: Text(
                          'Mar 19',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5833333333333333),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 21),
                              child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                  Text(
                                'Last Week',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                    fontFamily: 'Avenir Next',
                                    fontSize: 11,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                        ]),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ListTile(
                                  onTap: () {
                                    _bottomSheetMore(context);
                                  },
                                  leading: Container(child: Icon(Icons.money)),
                                  title: Text(
                                    'DSTV Premium to 2352432',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(79, 79, 79, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.3571428571428572),
                                  ),
                                  subtitle: Text(
                                    '- N20,000',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(130, 130, 130, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.3571428571428572),
                                  ),
                                  trailing: Text(
                                    'Mar 19',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(130, 130, 130, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 12,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5833333333333333),
                                  )),
                            );
                          }))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _bottomSheetMore(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (builder) {
        return new Container(
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 5.0,
            bottom: 5.0,
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0))),
          child: new Wrap(
            children: <Widget>[
              Center(
                  child: Container(
                      width: 70,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ))),
              Padding(
                padding: EdgeInsets.only(left: 38, top: 16),
                child: Text(
                  'Transaction Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(47, 165, 224, 1),
                      fontFamily: 'Avenir Next',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.1875),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 38),
                child: ListTile(
                    title: Text(
                      'Service',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(189, 189, 189, 1),
                          fontFamily: 'Avenir Next',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.3571428571428572),
                    ),
                    subtitle: Text(
                      'DSTV Premium ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(79, 79, 79, 1),
                          fontFamily: 'Avenir Next',
                          fontSize: 18,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.0555555555555556),
                    ),
                    trailing: Text('')),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 38),
                child: ListTile(
                    title: Text(
                      'Amount',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(189, 189, 189, 1),
                          fontFamily: 'Avenir Next',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.3571428571428572),
                    ),
                    subtitle: Text(
                      'N20,0000 ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(79, 79, 79, 1),
                          fontFamily: 'Avenir Next',
                          fontSize: 18,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.0555555555555556),
                    ),
                    trailing: Text('')),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 38),
                child: ListTile(
                    title: Text(
                      'Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(189, 189, 189, 1),
                          fontFamily: 'Avenir Next',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.3571428571428572),
                    ),
                    subtitle: Text(
                      '12th March 2020, 12:03pm',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(79, 79, 79, 1),
                          fontFamily: 'Avenir Next',
                          fontSize: 18,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.0555555555555556),
                    ),
                    trailing: Text('')),
              )
            ],
          ),
        );
      },
    );
  }
}
