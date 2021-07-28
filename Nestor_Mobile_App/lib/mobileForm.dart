import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/ui/authentication/otp.dart';
import 'package:nestore/ui/authentication/sign_up.dart';
import 'package:nestore/ui/common/BorderLessTextField.dart';

class MobilePage extends StatefulWidget {
  String email;
  MobilePage({Key key, this.email}) : super(key: key);

  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  TextEditingController mobileCtrl = TextEditingController(text: '');
  final authService = AuthService();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String mobile;
  String countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 45, bottom: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'Skip for now',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      )))),
                        ],
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 35, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          'Enter your phone',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ))),
                Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          'number',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ))),
                Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35, bottom: 0, left: 10, right: 10),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                          child: BorderLessTextField(
                              placeholderText: 'Enter your phone number',
                              keyboardType: TextInputType.number,
                              onChange: (value) {
                                setState(() {
                                  mobile = value;
                                });
                              },
                              onCountryChange: (value) {
                                setState(() {
                                  countryCode = value;
                                });
                              })),
                    )),
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2,
                          bottom: 0,
                          left: 10,
                          right: 10),
                      child: RawMaterialButton(
                        onPressed: () {
                          verifyNumber();
                        },
                        elevation: 2.0,
                        fillColor: Colors.black,
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12.0),
                      )),
                ),
              ],
            )),
      ),
    );
  }

  verifyNumber() async {
    if (mobile != null && countryCode != null) {
      var payload = {
        "contact": mobile,
        "country_code": countryCode,
        'email': widget.email
      };

      Result response = await authService.verifyMobile(payload);
      if (response is SuccessState) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPPage(),
          ),
        );
      } else if (response is ErrorState) {
        final snackBar = SnackBar(
          content: Text(response.msg[0]['msg']),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {}
  }
}
