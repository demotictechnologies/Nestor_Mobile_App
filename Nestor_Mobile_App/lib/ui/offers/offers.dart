import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/offers/OffersList.dart';

class OffersPage extends StatefulWidget {
  OffersPage({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<OffersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.12),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: MediaQuery.of(context).size.height * 0.008),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: GestureDetector(
                                      onTap:(){
                                        Navigator.of(context).pop();
                                      },
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.arrow_back, size: 30,color: AppColors.primaryColor)
                                      )
                                  )
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top:10),
                              child: Container(
                                width: double.infinity,
                                child: Text('All Offers',style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),),
                              )
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                  left: 0, right: 0, top:0, bottom:0),
              child: Column(
                children: [
                  OffersList()
                ],
              )
          ),
        ),
    );
  }
}