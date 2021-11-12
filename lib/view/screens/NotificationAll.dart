import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/Statistics.dart';
import 'package:creditswitch/view/screens/cashback.dart';
import 'package:creditswitch/view/screens/fund_wallet.dart';
import 'package:creditswitch/view/screens/wallet_history.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class NotificationAll extends StatefulWidget {
  @override
  _NotificationAllState createState() => _NotificationAllState();
}

class _NotificationAllState extends State<NotificationAll> {
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
                'Notifications',
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
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 21),
                            child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                Text(
                              'Most Recent',
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
                                    'Clear All',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(225, 81, 113, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 12,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5833333333333333),
                                  ),
                                ]),
                                onTap: () {
                                  // _bottomSheetMore(context);
                                },
                              ))
                        ]),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ListTile(
                                  onTap: () {
                                    //  _bottomSheetMore(context);
                                  },
                                  leading: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(225, 81, 113, 1),
                                    ),
                                  ),
                                  title: Text(
                                    '931 App now allows you to make DSTV payments without....',
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
                                    '',
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
}
