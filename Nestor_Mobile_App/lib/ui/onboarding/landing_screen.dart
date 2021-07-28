import 'package:flutter/material.dart';
import 'package:nestore/ui/authentication/login_screen.dart';
import 'package:nestore/ui/authentication/sign_up.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.19, bottom: 10, left: 20, right: 0),
                    child: Image.asset('graphics/landing.png', height: MediaQuery.of(context).size.height * 0.3,)
                )
            ),

            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 25, bottom: 0, left: 20, right: 20),
                  child: Text("Welcome To nestore", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                  )
              ),
            ),
            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 35, bottom: 10, left: 70, right: 70),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit', style: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)
              ),
            ),
            Container(
              width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top:  MediaQuery.of(context).size.height * 0.12, bottom: 0, left: 40, right: 40),
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
                    child: Text('Sign in', style: TextStyle(color: Colors.white),),
                    padding: EdgeInsets.all(12.0),

                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, bottom: 10, top:10),
              child: Container(
                width:double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(
                        top:  0, bottom: 10, left: 40, right: 40),
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      elevation: 0.0,
                      fillColor: Colors.white,
                      child: Text('Sign up', style: TextStyle(color: Colors.black),),
                      padding: EdgeInsets.all(12.0),

                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}