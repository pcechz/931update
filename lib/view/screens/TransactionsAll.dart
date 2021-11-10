import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/Statistics.dart';
import 'package:creditswitch/view/screens/cashback.dart';
import 'package:creditswitch/view/screens/fund_wallet.dart';
import 'package:creditswitch/view/screens/wallet_history.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class TransactionsAll extends StatefulWidget {
  @override
  _TransactionsAllState createState() => _TransactionsAllState();
}

class _TransactionsAllState extends State<TransactionsAll> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: AnimatedContainer(
                            color: Color.fromRGBO(196, 196, 196, 0.07),
                            duration: Duration(milliseconds: 400),
                            width: _folded
                                ? 41
                                : MediaQuery.of(context).size.width - 38,
                            height: 41,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.only(left: 16),
                                      child: !_folded
                                          ? TextFormField(
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      45, 156, 219, 1),
                                                  fontFamily: 'Avenir Next',
                                                  fontSize: 20,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 0.95),
                                              decoration: InputDecoration(
                                                  fillColor: Color.fromRGBO(
                                                      196, 196, 196, 0.07),
                                                  filled: true,
                                                  hintText: "",
                                                  hintStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          45, 156, 219, 1),
                                                      fontFamily: 'Avenir Next',
                                                      fontSize: 20,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 0.95),
                                                  border: InputBorder.none),
                                            )
                                          : null),
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      child: _folded
                                          ? Icon(
                                              Icons.search,
                                              color: Color.fromRGBO(
                                                  44, 164, 224, 1),
                                            )
                                          : Container(
                                              width: 20,
                                              height: 20,
                                              child: Text(
                                                'X',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontFamily: 'Avenir Next',
                                                    fontSize: 11,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1.7272727272727273),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    196, 196, 196, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.elliptical(20, 20)),
                                              )),
                                      onTap: () {
                                        setState(() {
                                          _folded = !_folded;
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
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
                              child: InkWell(
                                child: Row(children: [
                                  Text(
                                    'Sort By Date',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(79, 79, 79, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 12,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5833333333333333),
                                  ),
                                  8.width,
                                  Image.asset(
                                    'assets/filter.png',
                                    height: 13,
                                    width: 13,
                                    fit: BoxFit.cover,
                                  ),
                                ]),
                                onTap: () {
                                  _bottomSheetMore(context);
                                },
                              ))
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
