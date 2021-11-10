import 'dart:async';
import 'dart:convert';

import 'package:creditswitch/model/apis/Api.dart';
import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/SetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart' as t;


class PinAuth extends StatefulWidget {
  static String tag = '/PinAuth';
  @override
  PinAuthState createState() => PinAuthState();
}

class PinAuthState extends State<PinAuth> {
  bool onboarding = false;
  bool isApiCallProcess = false;
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final _pageController = PageController();
  String pin;

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.0, height / 3.5, 3.0, 0),
                  child: Container(
                      width: width - 6,
                      height: height / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Account Verification",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: fa_color_secondary),
                                      ),
                                      Align(
                                        child: Text(
                                          "Kindly check your email inbox /text messages \n and enter token to activate your account",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                              color: fa_sub_heading),
                                          textAlign: TextAlign.center,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ])),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(17, 40, 0, 18),
                                child: PinPut(
                                  useNativeKeyboard: true,
                                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                                  withCursor: true,
                                  fieldsCount: 5,
                                  fieldsAlignment:
                                      MainAxisAlignment.spaceAround,
                                  textStyle: const TextStyle(
                                      fontSize: 25.0, color: Colors.black),
                                  eachFieldMargin: EdgeInsets.all(0),
                                  eachFieldWidth: 45.0,
                                  eachFieldHeight: 55.0,
                                  onSubmit: (String pinn) => pin = pinn,
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                  submittedFieldDecoration: pinPutDecoration,
                                  selectedFieldDecoration:
                                      pinPutDecoration.copyWith(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromRGBO(
                                          160, 215, 220, 1),
                                    ),
                                  ),
                                  followingFieldDecoration: pinPutDecoration,
                                  pinAnimationType: PinAnimationType.scale,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: MaterialButton(
                                  minWidth:
                                      MediaQuery.of(context).size.width - 32,
                                  height: 54,
                                  onPressed: () {
                                    verifyOTP(pin);
                                  },
                                  color: fa_color_secondary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Verify OTP",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ]),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                ResendOTP();
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Experiencing any issues? ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: fa_color_secondary),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'RESEND OTP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: fa_color_secondary))
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ])),
                ),
                // Align(
                //     alignment: Alignment.bottomCenter,
                //     child: FadeAnimation(
                //         2.5,
                //         Image.asset(
                //           'copyright.png',
                //           height: 48.0,
                //           width: 182.0,
                //           fit: BoxFit.cover,
                //         ),
                //         Curves.slowMiddle))
              ],
            )));
  }

  ResendOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    var jsonResponse = null;
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Channel': 'mobile'
    };
    if (pin != null || pin != "") {
      var request = http.Request('POST', Uri.parse(Apis.OTPResendApi));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        jsonResponse = json.decode(await response.stream.bytesToString());
        print(jsonResponse);
        if (jsonResponse != null) {
          setState(() {
            isApiCallProcess = false;
            SetPassword().launch(context);

            // PinAuth(email, phone).launch(context);
          });
        }
      } else if (response.statusCode == 401) {
      jsonResponse = json.decode(await response.stream.bytesToString());
      t.Toast.show(jsonResponse["message"].toString(), context,
          duration: t.Toast.LENGTH_LONG,
          gravity: t.Toast.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      setState(() {
        isApiCallProcess = false;
      });

      jsonResponse = json.decode(await response.stream.bytesToString());
      print(jsonResponse);

      if (jsonResponse["data"]["field_errors"] != null) {
        var concatenate = StringBuffer();
        print(jsonResponse["data"].toString());

        for (var v in jsonResponse["data"]["field_errors"]) {
          print(v);
          //below is the solution
          v.forEach((i, value) {
            concatenate.write(value.toString() + "\n");
          });
        }

        t.Toast.show(concatenate.toString(), context,
            duration: t.Toast.LENGTH_LONG,
            gravity: t.Toast.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        t.Toast.show(jsonResponse["message"].toString(), context,
            duration: t.Toast.LENGTH_LONG,
            gravity: t.Toast.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }

      print("The error message is: ${jsonResponse["message"].toString()}");
    }
    } else {
      print("Password don't match");
    }
  }

  verifyOTP(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {"otp": pin};

    var jsonResponse = null;
    print(data);
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Channel': 'mobile'
    };
    if (pin != null || pin != "") {
      var request = http.Request('POST', Uri.parse(Apis.OTPApi));
      request.body = json.encode(data);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        jsonResponse = json.decode(await response.stream.bytesToString());
        print(jsonResponse);
        if (jsonResponse != null) {
          setState(() {
            isApiCallProcess = false;
            SetPassword().launch(context);

            // PinAuth(email, phone).launch(context);
          });
        }
      } else if (response.statusCode == 401) {
      jsonResponse = json.decode(await response.stream.bytesToString());
      t.Toast.show(jsonResponse["message"].toString(), context,
          duration: t.Toast.LENGTH_LONG,
          gravity: t.Toast.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      setState(() {
        isApiCallProcess = false;
      });

      jsonResponse = json.decode(await response.stream.bytesToString());
      print(jsonResponse);

      if (jsonResponse["data"]["field_errors"] != null) {
        var concatenate = StringBuffer();
        print(jsonResponse["data"].toString());

        for (var v in jsonResponse["data"]["field_errors"]) {
          print(v);
          //below is the solution
          v.forEach((i, value) {
            concatenate.write(value.toString() + "\n");
          });
        }

        t.Toast.show(concatenate.toString(), context,
            duration: t.Toast.LENGTH_LONG,
            gravity: t.Toast.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        t.Toast.show(jsonResponse["message"].toString(), context,
            duration: t.Toast.LENGTH_LONG,
            gravity: t.Toast.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }

      print("The error message is: ${jsonResponse["message"].toString()}");
    }
    } else {
      print("Password don't match");
    }
  }

  Widget _entryField(String title, {bool isPassword = false}) {
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
            obscureText: isPassword && hidePassword,
            obscuringCharacter: "*",
            style: TextStyle(color: Color.fromRGBO(299, 299, 299, 1)),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey[50],
              filled: true,
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Color.fromRGBO(299, 299, 299, 1),
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )
                  : Visibility(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                      visible: false,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
