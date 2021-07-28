import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/onboarding/experience.dart';

class DeliveryPage extends StatefulWidget {
  DeliveryPage({Key key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {


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
                        top: MediaQuery.of(context).size.height * 0.04, bottom: 10, left: 20, right: 0),
                    child: Image.asset('graphics/driving.png', height: MediaQuery.of(context).size.height * 0.3,)
                )
            ),

            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 25, bottom: 0, left: 20, right: 20),
                  child: Text("Easy Order Fast Delivery", textAlign: TextAlign.center ,style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),
                  )
              ),
            ),
            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 15, bottom: 10, left: 50, right: 50),
                  child: Text('Prescription Upload - Verification - Doorstep Delivery - Get Medicine every month', style: TextStyle(color: Colors.grey[600], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold),
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
                        builder: (context) => ExperiencePage(),
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