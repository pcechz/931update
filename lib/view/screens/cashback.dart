import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class CashBack extends StatefulWidget {
  @override
  _CashBackState createState() => _CashBackState();
}

class _CashBackState extends State<CashBack> {
  bool _folded = true;

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
                'Cashback',
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
                'assets/avatarprofile.png',
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
                    100.height,
                    Center(
                      child: Column(
                        children: [
                          Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 21, top: 21, bottom: 21, right: 21),
                                child: Image.asset(
                                  'assets/cashback2.png',
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: 99,
                              height: 99,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(196, 235, 255, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(99, 99)),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 21, top: 34),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _entryField("AMOUNT TO WITHDRAW"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 23, 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: MaterialButton(
                                              minWidth: 309,
                                              height: 54,
                                              onPressed: () {},
                                              color: fa_color_secondary,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Text(
                                                "WITHDRAW",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          56.height,
                                          Text(
                                            'View my Account ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    242, 153, 74, 1),
                                                fontFamily: 'Avenir Next',
                                                fontSize: 15,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.2666666666666666),
                                          )
                                        ]),
                                  ])),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 35.0, 0),
      height: 71,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: fa_color_primary),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: false,
            obscuringCharacter: "*",
            style: TextStyle(color: Color.fromRGBO(299, 299, 299, 1)),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey[50],
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
