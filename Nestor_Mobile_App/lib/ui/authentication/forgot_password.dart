import 'package:flutter/material.dart';
import 'package:nestore/ui/authentication/login_screen.dart';
import 'package:nestore/ui/authentication/sign_up.dart';
import 'package:nestore/ui/common/TextField.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtrl = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: GestureDetector(
                                    onTap:(){
                                      Navigator.of(context).pop();
                                    },
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Icon(Icons.arrow_back)
                                    ),
                                  )
                                  )
                              ),
                          Expanded(
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.of(context).pop();
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.cancel_outlined,),
                                  )
                              )
                          )
                        ],
                      )
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 35, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('Forgot Password', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 25, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('Lorem ipsum dolor sit amet,', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 0, left: 10, right: 10),
                    child: Container(
                        width: double.infinity,
                        child: Text('consectetur adipiscing elit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                    )
                ),
                Container(
                    width:double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35, bottom: 0, left: 10, right: 10),
                      child: CommonTextField(
                        controller: emailCtrl,
                        placeholderText: 'Enter your email address',
                        onChange: (email) {

                        },
                        keyboardType: TextInputType.emailAddress,
                        error: null,
                      ),
                    )
                ),

                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top:  MediaQuery.of(context).size.height * 0.2, bottom: 0, left: 10, right: 10),
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        elevation: 2.0,
                        fillColor: Colors.black,
                        child: Text('Recover password', style: TextStyle(color: Colors.white),),
                        padding: EdgeInsets.all(12.0),

                      )
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}