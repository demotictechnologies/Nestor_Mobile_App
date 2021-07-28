import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/authentication/LoginOtp.dart';
import 'package:nestore/ui/authentication/LoginPassword.dart';
import 'package:nestore/ui/authentication/sign_up.dart';
import 'package:nestore/ui/common/TextField.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/static/privacyPolicy.dart';
import 'package:nestore/ui/static/termsAndCondition.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneCtrl = TextEditingController(text: '');
  TextEditingController passCtrl = TextEditingController(text: '');
  final authService = AuthService();
  String phone;
  String password;
  String phonedError;
  String emailError;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                          top: 45, bottom: 10, left: 0, right: 0),
                      child: GestureDetector(
                          onTap:(){
                            Navigator.of(context).pop();
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_back, size: 30,)
                          )
                      )
                  ),
                ),
                Container(
                    width: double.infinity,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02, bottom: 0, left: 10, right: 10),
                        child: Image.asset('graphics/logo.png', height: 100,)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 35, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('Sign in', style: TextStyle(fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('sign in to access your orders, special offers, health tips and more!', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w300),)
                    )
                ),
                Container(
                    width:double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35, bottom: 0, left: 10, right: 10),
                      child: CommonTextField(
                        controller: phoneCtrl,
                        placeholderText: 'Phone Number',
                        onChange: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        error: phonedError,
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            Text('By continuing you agree to our ', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE),),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TermsAndCondition(),
                                  ),
                                );
                              },
                              child: Text('Terms of service ', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, color: AppColors.primaryColor),),
                            ),
                            Text('and', style: TextStyle(fontSize: 14)),
                            GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy(),
                                    ),
                                  );
                                },
                              child: Text(' Privacy & Legal Policy.', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, color: AppColors.primaryColor))
                            )
                          ],
                        )
                    )
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 0, left: 10, right: 10),
                      child: BorderButton(Title: 'LOG IN USING OTP', onClick: (){
                    userLogin();
                  },)
                  ),
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top:  MediaQuery.of(context).size.height * 0.03, bottom: 0, left: 10, right: 10),
                      child: GestureDetector(
                        child: Text("OR", style: TextStyle(color: Colors.black, fontSize: AppStyles.SMALL_TEXTSIZE),textAlign: TextAlign.center,
                        )
                      )
                  ),
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 0, left: 10, right: 10),
                      child: BorderButton(Title: 'USE PASSWORD', onClick: (){
                    userLoginPassword();
                  },)
                  ),
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top:  MediaQuery.of(context).size.height * 0.03, bottom: 0, left: 10, right: 10),
                      child: GestureDetector(
                          child: Text("OR", style: TextStyle(color: Colors.black, fontSize: AppStyles.SMALL_TEXTSIZE),textAlign: TextAlign.center,
                          )
                      )
                  ),
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 0, left: 10, right: 10),
                      child: BorderButton(Title: 'SIGN UP', onClick: (){
                    Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                  },)
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }


  userLogin() async {
    if(phone != null){
      var payload = {
        "mobile": phone
      };
      print(payload);
      Result response  = await authService.loginByOTP(payload);
      if(response is SuccessState) {
        print(response.value['message']);
        final snackBar = SnackBar(
          content: Text(response.value['message']),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        if(response.value['status'] == true) {
          phoneCtrl.text = '';
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginOtp(phone: phone),
            ),
          );
        }
      }

    } else {
      if(phone == null ) {
        setState(() {
          emailError = 'Phone number is required!';
        });
      }
    }
  }

  userLoginPassword() async {
    if(phone != null){
      phoneCtrl.text = '';
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginPassword(phone: phone),
        ),
      );
    } else {
      if(phone == null ) {
        setState(() {
          phonedError = 'Phone number is required!';
        });
      }
    }
  }
}