import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_style.dart';

class TermsAndCondition extends StatefulWidget {
  TermsAndCondition({Key key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<TermsAndCondition> {
  final authService = AuthService();
  String TermsAndCondtion = '';

  void initState() {
    super.initState();
    getTermsAndCondition();
  }

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
                  child: Text("Terms & Condition", style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),
                  )
              ),
            ),
            Container(
              // width:double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 35, bottom: 10, left: 10, right: 10),
                  child: Text(TermsAndCondtion, style: TextStyle(color: Colors.grey[600], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold),)
              ),
            ),
          ],
        ),
        )
      ),
    );
  }

  getTermsAndCondition() async {
    Result response  = await authService.getTermsAndCondition();
    if(response is SuccessState) {
      print(response.value);
      if(response.value['status'] == true) {
        setState(() {
          TermsAndCondtion = response.value['data'];
        });
      }
    }
  }
}