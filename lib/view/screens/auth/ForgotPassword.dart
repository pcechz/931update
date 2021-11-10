import 'dart:async';
import 'dart:convert';

import 'package:creditswitch/model/apis/Api.dart';
import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/SetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_validator/form_validator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  static String tag = '/PinAuth';
  // String text;
  // String text2;

  // ForgotPassword(this.text, this.text2);

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  bool onboarding = false;
  bool isApiCallProcess = false;
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

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
            child: Text('')));
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
