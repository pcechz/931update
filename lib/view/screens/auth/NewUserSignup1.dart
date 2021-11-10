import 'dart:async';
import 'dart:convert';

import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/auth/NewUserSignup2.dart';
import 'package:creditswitch/view/screens/auth/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:form_validator/form_validator.dart';
import 'package:device_info/device_info.dart';

class NewUserSignup1 extends StatefulWidget {
  static String tag = '/NewUserSignup1';

  @override
  NewUserSignup1State createState() => NewUserSignup1State();
}

class NewUserSignup1State extends State<NewUserSignup1> {
  bool onboarding = false;
  bool isApiCallProcess = false;
  bool hidePassword = true;
  TextEditingController _Emailcontroller = TextEditingController();
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _validate() {
    if (formKey.currentState.validate()) {
      // NewUserSignup2(_Emailcontroller.text).launch(context);
    }
    ;
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.0, height / 6, 3.0, 0),
                  child: Container(
                      width: width - 6,
                      height: height - ((height / 4.1)),
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
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: fa_color_secondary),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Welcome to 931 App!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: fa_sub_heading),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                                21, context.height() / 3.5, 0, 0),
                            child: Center(
                              child: Form(
                                  key: formKey,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _entryField(
                                            "EMAIL ADDRESS", _Emailcontroller),
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
                                              _validate();
                                            },
                                            color: fa_color_secondary,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              "Signup",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: context.height() / 30),
                                        Align(
                                          alignment: Alignment.center,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "Already have an account? ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: fa_sub_heading),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Login',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 13,
                                                        color:
                                                            fa_color_secondary))
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: context.height() / 50),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Image.asset(
                                                'assets/facebookSignup.png',
                                                height: 37.0,
                                                width: 37.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                                height: context.width() / 30),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset(
                                                'assets/googlesignup.png',
                                                height: 37.0,
                                                width: 37.0,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: context.width() / 30),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text:
                                                "By signing up you agree with the \nTerms of services and Privacy policy",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                color: fa_color_secondary),
                                          ),
                                        ),
                                      ])),
                            ))
                      ])),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: FadeAnimation(
                        2.5,
                        Image.asset(
                          'assets/copyright.png',
                          height: 20.0,
                          width: 182.0,
                          fit: BoxFit.cover,
                        ),
                        Curves.slowMiddle))
              ],
            )));
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
              errorStyle: TextStyle(fontSize: 8),
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
