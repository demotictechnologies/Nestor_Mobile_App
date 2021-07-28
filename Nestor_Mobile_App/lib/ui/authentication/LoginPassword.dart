import 'package:flutter/material.dart';
import 'package:nestore/bloc/auth_bloc.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/authentication/login_success.dart';
import 'package:nestore/ui/common/TextField.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/static/privacyPolicy.dart';
import 'package:nestore/ui/static/termsAndCondition.dart';

class LoginPassword extends StatefulWidget {
  final String phone;
  LoginPassword({Key key, this.phone}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPassword> {
  TextEditingController otpCtrl = TextEditingController(text: '');
  TextEditingController passCtrl = TextEditingController(text: '');
  final authService = AuthService();
  String otp;
  String password;
  String otpError;
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
                        child: Text('Verification', style: TextStyle(fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('verify to access your orders, special offers, health tips and more!', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w300),)
                    )
                ),
                Container(
                    width:double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 0, left: 10, right: 10),
                      child: CommonTextField(
                        isPasswordTextField: true,
                        controller: otpCtrl,
                        placeholderText: 'Password',
                        onChange: (value) {
                          setState(() {
                            otp = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        error: otpError,
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
    if(otp != null){
      var payload = {
        "mobile": this.widget.phone,"password": otp
      };

      Result response  = await authService.loginByPassword(payload);
      if(response is SuccessState) {
        print(response.value);
        final snackBar = SnackBar(
          content: Text(response.value['message']),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        if(response.value['status'] == true) {
          otpCtrl.text = '';
          authBloc.openSession(response.value['data']);
          if(response.value['data']['role'] == 'User') {
            authBloc.setData(response.value['data']['token'], 'token');
            authBloc.setData(response.value['data']['role'], 'role');
            authBloc.setData(response.value['data']['mobile'], 'mobile');
            if(response.value['data']['wallet'] != null) {authBloc.setData(response.value['data']['wallet'], 'wallet');}
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SuccessLogin(data: true),
              ),
            );
          } else {
            authBloc.setData(response.value['data']['token'], 'token');
            authBloc.setData(response.value['data']['chemist_name'], 'chemist_name');
            authBloc.setData(response.value['data']['contact_person'], 'contact_person');
            authBloc.setData(response.value['data']['role'], 'role');
            authBloc.setData(response.value['data']['mobile'], 'mobile');
            authBloc.setData(response.value['data']['wallet'], 'wallet');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SuccessLogin(data: false),
              ),
            );
          }

        } else {
          final snackBar = SnackBar(
            content: Text(response.value['message']),
            duration: Duration(seconds: 2),
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);
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
      if(otp == null ) {
        setState(() {
          phoneError = 'OTP is required!';
        });
      }
    }
  }
}