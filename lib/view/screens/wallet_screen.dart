import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/cashback.dart';
import 'package:creditswitch/view/screens/fund_wallet.dart';
import 'package:creditswitch/view/screens/wallet_history.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 250,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Figma Flutter Generator SfprotextsemiboWidget - TEXT
                        Text(
                          'Wallet',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular Std',
                              fontSize: 24,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 0.7916666666666666),
                        ),
                        Image.asset(
                          'assets/avatarsmall.png',
                          height: 32.0,
                          width: 32.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 127,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                              offset: Offset(0, 1),
                              blurRadius: 10)
                        ],
                        color: Color.fromRGBO(30, 150, 210, 1),
                      ),
                      child: 
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 21, top: 18),
                                            child: Image.asset(
                                              'assets/walletvector.png',
                                              height: 19.0,
                                              width: 19.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 11),
                                            child: Text(
                                              'N 20,600',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontFamily: 'Circular Std',
                                                  fontSize: 30,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.7916666666666666),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 12),
                                            child: Text(
                                              'My Balance',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontFamily: 'Avenir Next',
                                                  fontSize: 12,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.7916666666666666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return FundWallet();
                                          }));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 20, top: 39),
                                              child: Image.asset(
                                                'assets/add_green.png',
                                                height: 49.0,
                                                width: 49.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 20, top: 12),
                                              child: Text(
                                                'Fund Wallet',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: 'Avenir Next',
                                                    fontSize: 12,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7916666666666666),
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
                          ]),
                    ),
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 68,
                                    height: 59,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: Color.fromRGBO(111, 207, 151, 1),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14,
                                            left: 16,
                                            right: 16,
                                            bottom: 10),
                                        child: Image.asset(
                                          'assets/mybank.png',
                                          height: 35.0,
                                          width: 35.0,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  8.height,
                                  Text(
                                    'My bank',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(130, 130, 130, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 13,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.4615384615384615),
                                  )
                                ]),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 68,
                                    height: 59,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: Color.fromRGBO(86, 204, 242, 1),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14,
                                            left: 16,
                                            right: 16,
                                            bottom: 10),
                                        child: Image.asset(
                                          'assets/cashbackwallet.png',
                                          height: 35.0,
                                          width: 29.0,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  8.height,
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return CashBack();
                                      }));
                                    },
                                    child: Text(
                                      'Cashback',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(130, 130, 130, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 13,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.4615384615384615),
                                    ),
                                  )
                                ]),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 68,
                                    height: 59,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: Color.fromRGBO(159, 224, 43, 1),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14,
                                            left: 16,
                                            right: 16,
                                            bottom: 10),
                                        child: Image.asset(
                                          'assets/transferwallet.png',
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  8.height,
                                  Text(
                                    'Transfer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(130, 130, 130, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 13,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.4615384615384615),
                                  )
                                ]),
                          ],
                        )),
                    36.height,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 21),
                            child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                Text(
                              'Wallet History',
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
                                  return WalletHistory();
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
                    25.height,
                    Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 23),
                                                child: Container(
                                                    width: 11,
                                                    height: 11,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          242, 153, 74, 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.elliptical(
                                                                  11, 11)),
                                                    ))),
                                            18.width,
                                            Text(
                                              'Funded via 737 ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      79, 79, 79, 1),
                                                  fontFamily: 'Avenir Next',
                                                  fontSize: 14,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.3571428571428572),
                                            )
                                          ]),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                '+N50,000',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontFamily: 'Avenir Next',
                                                    fontSize: 17,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1.1176470588235294),
                                              ),
                                              Text(
                                                'Feb 16, 2020',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        45, 156, 219, 1),
                                                    fontFamily: 'Avenir Next',
                                                    fontSize: 9,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 2.111111111111111),
                                              )
                                            ]),
                                      ),
                                    ]),
                                11.height,
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 50, left: 53),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                103,
                                        height: 0.5,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(196, 196, 196, 1),
                                        ))),
                                17.height,
                              ]);
                            }))
                
                
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
