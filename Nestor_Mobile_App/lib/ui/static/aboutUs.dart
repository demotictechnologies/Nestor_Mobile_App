import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/home/InnerHeader.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<AboutUs> {
  final authService = AuthService();
  var AboutUs;
  String title1 = '';
  String dec1 = '';
  String dec2 = '';
  String title2 = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    getTermsAndCondition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.1),
        child: InnerHeader(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                child: Column(
                  children: [
                    Container(
                      width:double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 35, bottom: 10, left: 10, right: 10),
                          child: Text(title1, style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Container(
                      width:double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 10, left: 10, right: 10),
                          child: Text(dec1, style: TextStyle(color: Colors.grey[800], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w400),)
                      ),
                    ),
                    Container(
                      width:double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 35, bottom: 10, left: 10, right: 10),
                          child: Text(title2, style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Container(
                      width:double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 10, left: 10, right: 10),
                          child: Text(dec2, style: TextStyle(color: Colors.grey[800], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w400),)
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  getTermsAndCondition() async {
    Result response  = await authService.getAboutUs();
    if(response is SuccessState) {
      print(response.value);
      if(response.value['status'] == true) {
        setState(() {
          title1 = response.value['data']['title1'];
          title2 = response.value['data']['title2'];
          dec1 = response.value['data']['description1'];
          dec2 = response.value['data']['description2'];
        });
      }
    }
  }
}