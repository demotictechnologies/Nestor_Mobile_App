import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/offers/offers.dart';
import 'package:nestore/ui/onboarding/kitchen_landing.dart';
import 'package:nestore/ui/static/aboutUs.dart';
import 'package:nestore/ui/user/addressList.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<AccountPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  var user;

  void initState() {
    super.initState();
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                child: Column(
                  children: [
                    if(user != null)
                    Container(
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top: 30, bottom: 20),
                            child: Align(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(Icons.account_circle,
                                          color: AppColors.primaryColor, size: 50)),
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0),
                                              child: Container(
                                                  width: double.infinity,
                                                  child: Text('${user['role']}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .bold)))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 5,
                                                  bottom: 0),
                                              child: Container(
                                                  width: double.infinity,
                                                  child: Text('${user['mobile']}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight
                                                              .bold)))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 5,
                                                  bottom: 0),
                                              child: Container(
                                                  width: double.infinity,
                                                  child: Text('Wallet: Rs. ${user['wallet']}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight
                                                              .bold))))
                                        ],
                                      ))
                                ],
                              ),
                            ))),
                   Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 30, bottom: 20),
                              child: Column(
                                children: [
                                  GestureDetector(
                                  onTap: (){
                          // Navigator.of(context).push(
                          // MaterialPageRoute(
                          // builder: (context) => OffersPage(),
                          // ),
                          // );
                          },
                            child: Align(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Icon(Icons.local_offer,
                                                color: AppColors.primaryColor, size: 30)),
                                        Expanded(
                                            flex: 4,
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey[200],
                                                              width: 1.0))),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 0,
                                                          right: 0,
                                                          top: 0,
                                                          bottom: 20),
                                                      child: Container(
                                                          width: double.infinity,
                                                          child: Text('Refund',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600)))),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  )),
                       
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 30, bottom: 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Icon(Icons.home_work,
                                                color: AppColors.primaryColor, size: 30)),
                                        Expanded(
                                            flex: 4,
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey[200],
                                                              width: 1.0))),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                            builder: (context) => AddressList(),
                                                          ),
                                                        );
                                                      },
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 0,
                                                              right: 0,
                                                              top: 0,
                                                              bottom: 20),
                                                          child: Container(
                                                              width: double.infinity,
                                                              child: Text('Delivery Address',
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w600))))
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 30, bottom: 0),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => AboutUs(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Icon(Icons.help,
                                                    color: AppColors.primaryColor, size: 30)),
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors.grey[200],
                                                                  width: 1.0))),
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 0,
                                                              right: 0,
                                                              top: 0,
                                                              bottom: 20),
                                                          child: Container(
                                                              width: double.infinity,
                                                              child: Text('About Us',
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w600)))),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        )
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        userLogout();
                                      },
                                      child:  Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, top: 30, bottom: 0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Icon(Icons.power_settings_new,
                                                    color: AppColors.primaryColor, size: 30)),
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors.grey[200],
                                                                  width: 1.0))),
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 0,
                                                              right: 0,
                                                              top: 0,
                                                              bottom: 20),
                                                          child: Container(
                                                              width: double.infinity,
                                                              child: Text('Logout',
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w600)))),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ))),

                  ],
                ))),
      ),
    );
  }

  userLogout() async {
    Result response  = await authService.logout();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => KitchenPage(),
      ),
    );
  }

  getUserDetail() async {
    Result response  = await authService.getUserDetail();
    if(response is SuccessState) {
      print(response.value);
      setState(() {
        user = response.value['Data'];
      });
    }
  }
}
