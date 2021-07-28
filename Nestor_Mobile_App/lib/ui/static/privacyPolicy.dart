import 'package:flutter/material.dart';
import 'package:nestore/resources/app_style.dart';

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({Key key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<PrivacyPolicy> {


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
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 0, bottom: 0, left: 10, right: 10),
                      child: Text("Privacy Policy", style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),
                      )
                  ),
                ),
                Container(
                  // width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 35, bottom: 10, left: 10, right: 10),
                      child: Text('The following are the terms and conditions, read together with the Privacy Policy, that govern your purchase and use of the products and service s (the products) from Netstore.com, and constitute a legally binding agreement, between you ("the customer", the "user" or "the caregiver") and Netstore.com, a fully licensed Pharmacy.', style: TextStyle(color: Colors.grey[600], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold),)
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}