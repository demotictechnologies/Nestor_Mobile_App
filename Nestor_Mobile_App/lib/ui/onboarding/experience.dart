import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/authentication/login_screen.dart';
import 'package:nestore/ui/common/borderButton.dart';

class ExperiencePage extends StatefulWidget {
  ExperiencePage({Key key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {


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
                        top: MediaQuery.of(context).size.height * 0.06, bottom: 0, left: 10, right: 10),
                    child: Image.asset('graphics/logo.png', height: 100,)
                )
            ),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08, bottom: 10, left: 20, right: 0),
                    child: Image.asset('graphics/bed.png', height: MediaQuery.of(context).size.height * 0.3,)
                )
            ),

            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 25, bottom: 0, left: 20, right: 20),
                  child: Text("There's a lot more...", style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),
                  )
              ),
            ),
            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 15, bottom: 10, left: 50, right: 50),
                  child: Text("Consult Doctor - Home LabTests - Save Health Records", style: TextStyle(color: Colors.grey[600], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)
              ),
            ),
            Container(
              width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top:  MediaQuery.of(context).size.height * 0.08, bottom: 0, left: 40, right: 40),
                  child: BorderButton(Title: 'Next', onClick: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },)
              ),
            ),
          ],
        ),
      ),
    );
  }
}