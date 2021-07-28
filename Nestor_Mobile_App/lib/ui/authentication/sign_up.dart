import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/authentication/otpVerification.dart';
import 'package:nestore/ui/common/TextField.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/static/privacyPolicy.dart';
import 'package:nestore/ui/static/termsAndCondition.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  TextEditingController phoneCtrl = TextEditingController(text: '');
  TextEditingController passCtrl = TextEditingController(text: '');
  final authService = AuthService();
  String phone;
  String password;
  String passwordError;
  String phoneError;
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
                        child: Text('Sign up', style: TextStyle(fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('sign up to access your orders, special offers, health tips and more!', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w300),)
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
                        error: phoneError,
                      ),
                    )
                ),
                Container(
                    width:double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 0, left: 10, right: 10),
                      child: CommonTextField(
                        isPasswordTextField: true,
                        controller: passCtrl,
                        placeholderText: 'Password',
                        onChange: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        error: passwordError,
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
                      child: BorderButton(Title: 'SUBMIT', onClick: (){
                    userLogin();
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
    if(phone != null && password != null ){
      var payload = {
        "mobile": phone,"password": password
      };

      Result response  = await authService.register(payload);
      if(response is SuccessState) {
        print(response.value['message']);
        final snackBar = SnackBar(
          content: Text(response.value['message']),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        if(true) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpVerificationPage(phone: phone),
            ),
          );
          phoneCtrl.text = '';
          passCtrl.text = '';
        }
      } else if(response is ErrorState) {
        print(response.msg);

        final snackBar = SnackBar(
          content: Text(response.msg),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      if(phone == null ) {
        setState(() {
          phoneError = 'Phone number is required!';
        });
      }
      if(password == null ) {
        setState(() {
          passwordError = 'Password is required!';
        });
      }
    }
  }
}