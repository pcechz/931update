import 'dart:async';
import 'dart:convert';

import 'package:creditswitch/model/apis/Api.dart';
import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/Home_base.dart';
import 'package:creditswitch/view/screens/auth/ForgotPassword.dart';
import 'package:creditswitch/view/screens/auth/NewUserSignup2.dart';
import 'package:creditswitch/view/screens/home_screen.dart';
import 'package:creditswitch/view/screens/auth/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_validator/form_validator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart' as t;

class ReturnLoginScreen extends StatefulWidget {
  static String tag = '/ReturnLoginScreen';

  @override
  ReturnLoginScreenState createState() => ReturnLoginScreenState();
}

class ReturnLoginScreenState extends State<ReturnLoginScreen> {
  bool onboarding = false;
  bool hidePassword = true;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final formKey = new GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: LoadingOverlay(
        isLoading: _isLoading,
        opacity: 0.6,
        progressIndicator: CircularProgressIndicator(),
        child: Container(
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
                  padding: EdgeInsets.fromLTRB(3.0, height / 6, 3.0, 0),
                  child: Container(
                      width: width - 6,
                      height: height - ((height / 3.97)),
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
                            Image.asset(
                              'assets/logo.png',
                              height: 118.0,
                              width: 118.0,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              21, context.height() / 5, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: fa_color_secondary),
                              ),
                              Text(
                                "Continue to Sign In!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: fa_sub_heading),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                                21, context.height() / 3.5, 0, 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _entryField("EMAIL", _emailcontroller),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _entryField("PASSWORD", _passwordcontroller,
                                      isPassword: true),
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
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 23, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: MaterialButton(
                                            minWidth: 309,
                                            height: 54,
                                            onPressed: () {
                                              login();
                                            },
                                            color: fa_color_secondary,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            onTap: () {
                                              showGeneralDialog(
                                                barrierLabel: "Label",
                                                barrierDismissible: true,
                                                barrierColor: Colors.black
                                                    .withOpacity(0.5),
                                                transitionDuration:
                                                    Duration(milliseconds: 700),
                                                context: context,
                                                pageBuilder:
                                                    (context, anim1, anim2) {
                                                  return Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    3.0,
                                                                    100,
                                                                    3.0,
                                                                    0),
                                                            child: Container(
                                                                child: Material(
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: <
                                                                      Widget>[
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                21,
                                                                                45,
                                                                                0,
                                                                                10),
                                                                            child:
                                                                                Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                                                                              Text(
                                                                                "Forgot Password",
                                                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: fa_color_secondary),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.only(top: 10),
                                                                                child: Align(
                                                                                  child: Text(
                                                                                    "Enter your registrated email address to \n receive password reset instruction",
                                                                                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: fa_sub_heading),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                ),
                                                                              ),
                                                                            ])),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              17,
                                                                              40,
                                                                              0,
                                                                              18),
                                                                      child: _entryField(
                                                                          "EMAIL",
                                                                          _emailcontroller),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              16,
                                                                          right:
                                                                              16,
                                                                          top:
                                                                              16,
                                                                          bottom:
                                                                              16),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      child:
                                                                          MaterialButton(
                                                                        minWidth:
                                                                            MediaQuery.of(context).size.width -
                                                                                32,
                                                                        height:
                                                                            54,
                                                                        onPressed:
                                                                            () {
                                                                          _displayDialog(
                                                                              context);
                                                                        },
                                                                        color:
                                                                            fa_color_secondary,
                                                                        elevation:
                                                                            0,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8)),
                                                                        child:
                                                                            Text(
                                                                          "Reset Password",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 15,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            )),
                                                          ),
                                                        ],
                                                      ));
                                                },
                                                transitionBuilder: (context,
                                                    anim1, anim2, child) {
                                                  return SlideTransition(
                                                    position: Tween(
                                                            begin: Offset(0, 1),
                                                            end: Offset(0, 0))
                                                        .animate(anim1),
                                                    child: child,
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Forgot Password?",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: fa_color_secondary),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ])),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: InkWell(
                                onTap: () {
                                  NewUserSignup2().launch(context);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: fa_sub_heading),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Sign Up',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: fa_color_secondary))
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ])),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: FadeAnimation(
                        2.5,
                        Image.asset(
                          'assets/copyright.png',
                          height: 48.0,
                          width: 182.0,
                          fit: BoxFit.cover,
                        ),
                        Curves.slowMiddle))
              ],
            )),
      )),
    );
  }

  _displayDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.0, 100, 3.0, 0),
                  child: Container(
                      child: Material(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(21, 45, 0, 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Check Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: fa_color_secondary),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Align(
                                            child: Text(
                                              "Follow a password recovery \ninstructions we have just sent to your \nemail address ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 13,
                                                  color: fa_sub_heading),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ])),
                            ],
                          ),
                          Center(
                            child: Image.asset(
                              'assets/checkemail.png',
                              height: 150.0,
                              width: 186.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width - 32,
                              height: 54,
                              onPressed: () {},
                              color: fa_color_secondary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "RETURN TO LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                  )),
                ),
              ],
            ));
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  login() async {
    setState(() {
      _isLoading = true;
    });

    Map data = {
      'email': _emailcontroller.text,
      "password": _passwordcontroller.text,
    };

    var jsonResponse = null;
    print(data);
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Channel': 'mobile'
    };
    var request = http.Request('POST', Uri.parse(Apis.loginApi));
    request.body = json.encode(data);

    // var response = await http.post(Uri.parse(Apis.loginApi), body: data);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      jsonResponse = json.decode(await response.stream.bytesToString());
      print(jsonResponse);
      if (jsonResponse != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = jsonResponse["data"]["token"].toString();
        prefs.setString('token', token);
        setState(() {
          _isLoading = false;
          HomeBase().launch(context);
        });
      }
    } else if (response.statusCode == 401 || response.statusCode == 422) {
      setState(() {
        _isLoading = false;
      });
      jsonResponse = json.decode(await response.stream.bytesToString());
      t.Toast.show(jsonResponse["message"].toString(), context,
          duration: t.Toast.LENGTH_LONG,
          gravity: t.Toast.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      setState(() {
        _isLoading = false;
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
        setState(() {
          _isLoading = false;
        });

        t.Toast.show(jsonResponse["message"].toString(), context,
            duration: t.Toast.LENGTH_LONG,
            gravity: t.Toast.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }

      print("The error message is: ${jsonResponse["message"].toString()}");
    }
    // } else {
    //   print("Password don't match");
    // }
  }

  Widget _entryField(String title, TextEditingController _controller,
      {bool isPassword = false}) {
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
            controller: _controller,
            validator: ValidationBuilder().minLength(5).maxLength(50).build(),
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
