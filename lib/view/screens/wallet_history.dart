import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class WalletHistory extends StatefulWidget {
  @override
  _WalletHistoryState createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  bool _folded = true;

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
                  'Sort By',
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
                  padding: EdgeInsets.only(left: 38, top: 31),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sort By Date',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.1875),
                        )
                      ])),
              Padding(
                  padding: EdgeInsets.only(left: 38, top: 31),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sort By Channel',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.1875),
                        )
                      ])),
              Padding(
                  padding: EdgeInsets.only(left: 38, top: 31),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sort By Amount',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.1875),
                        )
                      ])),
              Padding(
                  padding: EdgeInsets.only(left: 38, top: 31),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Clear History',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(235, 87, 87, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3571428571428572),
                        )
                      ])),
              Padding(
                  padding: EdgeInsets.only(left: 38, top: 31),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(235, 87, 87, 1),
                              fontFamily: 'Avenir Next',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3571428571428572),
                        )
                      ])),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: Container(
          //  color: Color.fromRGBO(44, 164, 224, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Wallet History',
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    24.height,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 0.95),
                                                decoration: InputDecoration(
                                                    fillColor: Color.fromRGBO(
                                                        196, 196, 196, 0.07),
                                                    filled: true,
                                                    hintText: "",
                                                    hintStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            45, 156, 219, 1),
                                                        fontFamily:
                                                            'Avenir Next',
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
                                                      height:
                                                          1.7272727272727273),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      196, 196, 196, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              20, 20)),
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
                          )
                        
                        
                        ]),
                    18.height,
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
                    25.height,
                    Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 8,
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


