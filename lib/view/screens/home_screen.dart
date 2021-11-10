import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/wallet_screen.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
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
                                Image.asset(
                                  'assets/applogowhite.png',
                                  height: 35.0,
                                  width: 36.0,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'assets/avatarsmall.png',
                                  height: 32.0,
                                  width: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          width: 139,
                                          height: 24,
                                          child: Stack(children: <Widget>[
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Text(
                                                  'Hello,',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Avenir Next',
                                                      fontSize: 24,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height:
                                                          0.7916666666666666),
                                                )),
                                            Positioned(
                                                top: 0,
                                                left: 71,
                                                child: Text(
                                                  'Tobi!',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Avenir Next',
                                                      fontSize: 24,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height:
                                                          0.7916666666666666),
                                                )),
                                          ])),
                                      Container(
                                          child: Text(
                                        'What would you like to do today?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontFamily: 'Avenir Next',
                                            fontSize: 16,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1.90625),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Wallet Balance:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Avenir Next',
                                      fontSize: 14,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5 /*PERCENT not supported*/
                                      ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return WalletScreen();
                                    }));
                                  },
                                  child: Text(
                                    ' N3,000.00',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Avenir Next',
                                        fontSize: 18,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                    Positioned(
                        top: 100,
                        left: 20,
                        right: 20,
                        child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 232,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.10000000149011612),
                                    offset: Offset(0, 1),
                                    blurRadius: 10)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/cablehome.png',
                                      height: 51.0,
                                      width: 51.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/datahome.png',
                                      height: 51.0,
                                      width: 51.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/callhome.png',
                                      height: 51.0,
                                      width: 51.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Figma Flutter Generator TelevisionWidget - TEXT
                                    Text(
                                      'Television',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                    // Figma Flutter Generator InternetWidget - TEXT
                                    Text(
                                      'Internet ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                    // Figma Flutter Generator AirtimeWidget - TEXT
                                    Text(
                                      ' Airtime',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/electricity.png',
                                      height: 51.0,
                                      width: 51.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/cashback.png',
                                      height: 51.0,
                                      width: 51.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/sms.png',
                                      height: 51.0,
                                      width: 51.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Figma Flutter Generator TelevisionWidget - TEXT
                                    Text(
                                      'Electricity',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                    // Figma Flutter Generator InternetWidget - TEXT
                                    Text(
                                      'Cashback ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                    // Figma Flutter Generator AirtimeWidget - TEXT
                                    Text(
                                      ' SMS',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    )
                                  ],
                                ),
                              )
                            ]))),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text('Refer to Earn!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w600,
                                          height: 1.1875)))),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 13, left: 0, right: 0),
                              child: Image.asset(
                                'assets/sharemylink.png',
                                height: 130.0,
                                width: 337.0,
                                fit: BoxFit.fill,
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text('Recent Activities',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w600,
                                          height: 1.1875)))),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Container(
                                height: 55,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          width: 127,
                                          child: Card(
                                            child: Container(
                                              child: Center(
                                                child: Image.asset(
                                                  'assets/9mobile.png',
                                                  height: 22.0,
                                                  width: 80.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            elevation: 8,
                                          ));
                                    })),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text('My Beneficiaries',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w600,
                                          height: 1.1875)))),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Active Projects'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              // ActiveProjectsCard(
                              //   cardColor: LightColors.kGreen,
                              //   loadingPercent: 0.25,
                              //   title: 'Medical App',
                              //   subtitle: '9 hours progress',
                              // ),
                              SizedBox(width: 20.0),
                              // ActiveProjectsCard(
                              //   cardColor: LightColors.kRed,
                              //   loadingPercent: 0.6,
                              //   title: 'Making History Notes',
                              //   subtitle: '20 hours progress',
                              // ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              // ActiveProjectsCard(
                              //   cardColor: LightColors.kDarkYellow,
                              //   loadingPercent: 0.45,
                              //   title: 'Sports App',
                              //   subtitle: '5 hours progress',
                              // ),
                              SizedBox(width: 20.0),
                              // ActiveProjectsCard(
                              //   cardColor: LightColors.kBlue,
                              //   loadingPercent: 0.9,
                              //   title: 'Online Flutter Course',
                              //   subtitle: '23 hours progress',
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
