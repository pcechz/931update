import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:creditswitch/model/apis/Api.dart';
import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/auth/PinAuth.dart';
import 'package:creditswitch/view/screens/auth/ReturnLoginScreen.dart';
import 'package:creditswitch/view/screens/auth/landing_page.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_mac/get_mac.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:form_validator/form_validator.dart';
import 'package:toast/toast.dart' as t;

class NewUserSignup2 extends StatefulWidget {
  static String tag = '/NewUserSignup2';
  //String email;

  // NewUserSignup2(this.email);

  @override
  NewUserSignup2State createState() => NewUserSignup2State();
}

class NewUserSignup2State extends State<NewUserSignup2> {
  bool onboarding = false;
  bool isApiCallProcess = false;
  bool hidePassword = true;
  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _UserNamecontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();
  TextEditingController _fNamecontroller = TextEditingController();
  TextEditingController _lNamecontroller = TextEditingController();
  TextEditingController _Phonecontroller = TextEditingController();
  TextEditingController _conPasswordcontroller = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  String deviceName;
  String deviceVersion;
  String identifier;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    setState(() {
      //  _Emailcontroller.text = widget.email;
    });
    initPlatformState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<List<String>> getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

//if (!mounted) return;
    return [deviceName, deviceVersion, identifier];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return LoadingOverlay(
        isLoading: isApiCallProcess,
        opacity: 0.6,
        progressIndicator: CircularProgressIndicator(),
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Column(children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sign Up!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: fa_color_secondary),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Welcome to 931 App! \nFill in the information below to get started.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: fa_sub_heading),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(21, 20, 0, 0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _entryField(
                                          "FIRST NAME*", _fNamecontroller),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      _entryField(
                                          "LAST NAME*", _lNamecontroller),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      _entryField(
                                          "USERNAME*", _UserNamecontroller),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      _entryField(
                                          "EMAIL ADDRESS*", _Emailcontroller),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      _entryField(
                                          "PHONE NUMBER*", _Phonecontroller),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      _entryField(
                                          "PASSWORD", _Passwordcontroller,
                                          isPassword: true),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      _entryField("CONFIRM PASSWORD",
                                          _conPasswordcontroller,
                                          isPassword: true),
                                      SizedBox(
                                        height: 20,
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
                                                onPressed: () {
                                                  signUp(
                                                    _Emailcontroller.text,
                                                    _fNamecontroller.text,
                                                    _lNamecontroller.text,
                                                    _Phonecontroller.text,
                                                  );
                                                },
                                                color: fa_color_secondary,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Text(
                                                  "Sign Up",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 35, 27, 0),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(10, 0,
                                                                  10, 20),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(
                                                                  Icons
                                                                      .arrow_back,
                                                                  color:
                                                                      fa_color_secondary),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  ReturnLoginScreen()
                                                                      .launch(
                                                                          context);
                                                                },
                                                                child: Text(
                                                                  "Go Back",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        15.0,
                                                                    color:
                                                                        fa_color_secondary,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ])),
                                            )
                                          ]),
                                    ])),
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
                ))),
      );
    }));
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  signUp(String email, String firstname, String lastname, String phone) async {
    setState(() {
      isApiCallProcess = true;
    });
    Map data = {
      'username': _UserNamecontroller.text,
      'email': email,
      "first_name": firstname,
      "last_name": lastname,
      "msisdn": phone,
      'password': _Passwordcontroller.text,
      'password_confirmation': _conPasswordcontroller.text,
      "device_uid": "866419058906749", //identifier,
      "mac_address": "64:c4:03:b4:d4:f3" //_platformVersion
    };

    var jsonResponse = null;
    print(data);
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Channel': 'mobile'
    };
    if (_conPasswordcontroller.text == _Passwordcontroller.text) {
      var request = http.Request('POST', Uri.parse(Apis.signUpApi));
      request.body = json.encode(data);

      // var response = await http.post(Uri.parse(Apis.loginApi), body: data);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        jsonResponse = json.decode(await response.stream.bytesToString());
        print(jsonResponse);

        if (jsonResponse != null && jsonResponse["data"]["token"] != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = jsonResponse["data"]["token"].toString();
          prefs.setString('token', token);
          setState(() {
            isApiCallProcess = false;
            PinAuth().launch(context);
          });
        }
      } else if (response.statusCode == 401) {
        setState(() {
          isApiCallProcess = false;
        });
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
          setState(() {
            isApiCallProcess = false;
          });
          t.Toast.show(jsonResponse["message"].toString(), context,
              duration: t.Toast.LENGTH_LONG,
              gravity: t.Toast.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        }

        print("The error message is: ${jsonResponse["message"].toString()}");
      }
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      print("Password don't match");
      t.Toast.show("Password don't match", context,
          duration: t.Toast.LENGTH_LONG,
          gravity: t.Toast.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
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
