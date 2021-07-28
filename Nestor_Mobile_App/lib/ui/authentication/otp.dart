import 'package:flutter/material.dart';
import 'package:nestore/ui/authentication/sign_up.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPPage extends StatefulWidget {
  OTPPage({Key key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController emailCtrl = TextEditingController(text: '');
  String otp;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool hasError = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 45, bottom: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container()
                          ),
                          Expanded(
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text('Skip for now', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
                                      )
                                  )
                              )
                          ),

                        ],
                      )
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 35, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('Enter the 4-digit', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('code sent to you at', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('0767217315', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: HexColor('34c47c')),)
                    )
                ),
                Container(
                    width:double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35, bottom: 0, left: 10, right: 10),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor:Colors.white,
                          inactiveFillColor: Colors.white,
                          inactiveColor: HexColor('efefef'),
                          activeColor: Colors.black,
                          selectedFillColor: Colors.white,
                          selectedColor: HexColor('1a1824')
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        textStyle: TextStyle(fontSize: 20, height: 1.6),
                        enableActiveFill: true,
                        controller: emailCtrl,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          print("Completed");
                          verifyOtp();
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            otp = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        },
                      )
                    )
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top:  MediaQuery.of(context).size.height * 0.2, bottom: 0, left: 10, right: 10),
                      child: GestureDetector(
                        onTap:(){
                          _showDialog();
                        },
                        child: Text("I haven't received a code", style: TextStyle(color: Colors.black, fontSize: 15),textAlign: TextAlign.center,
                        ),
                      )
                ),
                )
              ],
            )
        ),
      ),
    );
  }



  void _showDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: 35, bottom: 0, left: 30, right: 30),
                  child: Container(
                      width: double.infinity,
                      child: Text('Enter the 4-digit', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 5, bottom: 0, left: 30, right: 30),
                  child: Container(
                      width: double.infinity,
                      child: Text('Code sent to you at', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 5, bottom: 0, left: 30, right: 30),
                  child: Container(
                      width: double.infinity,
                      child: Text('0767217315', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: HexColor('34c47c')),)
                  )
              ),
              Container(
                width:double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(
                        top:  MediaQuery.of(context).size.height * 0.1, bottom: 0, left: 30, right: 30),
                    child: BorderButton(Title: 'Yes, respond code by SMS', onClick: (){
                    Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OTPPage(),
                          ),
                        );
                  },)
                ),
              ),
              Container(
                width:double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(
                        top:  20, bottom: 0, left: 30, right: 30),
                    child: GestureDetector(
                      onTap:(){
                        _showDialog();
                      },
                      child: Text("No, I want to change it", style: TextStyle(color: Colors.black, fontSize: 15),textAlign: TextAlign.center,
                      ),
                    )
                ),
              )
            ],
          )
        );
      },
    );
  }

  verifyOtp() async {
      if(otp != null && otp == '1111') {
        final snackBar = SnackBar(
          content: Text('OTP successfully verified!'),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        emailCtrl.text = '';
      } else {
        final snackBar = SnackBar(
          content: Text('OTP does not match!'),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    }
}