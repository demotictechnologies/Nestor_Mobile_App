import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestore/bloc/auth_bloc.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/chemist/orderHistory.dart';
import 'package:nestore/ui/chemist/trackOrder.dart';
import 'package:nestore/ui/home/CommonHeader.dart';
import 'package:nestore/ui/home/RoleHome.dart';
import 'package:nestore/ui/home/SideOrder.dart';
import 'package:nestore/ui/hotel/uploadPrescription.dart';
import 'package:nestore/ui/onboarding/kitchen_landing.dart';
import 'package:nestore/ui/product/categories.dart';
import 'package:nestore/ui/static/aboutUs.dart';
import 'package:nestore/ui/user/addressList.dart';
import 'package:nestore/ui/user/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonHome extends StatefulWidget {
  CommonHome({Key key}) : super(key: key);

  @override
  _CommonHomeState createState() => _CommonHomeState();
}

class _CommonHomeState extends State<CommonHome> {
  int _currentIndex = 0;
  List<Widget> _children = [];
  String role = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();
    getTermsAndCondition();
  }

  getTermsAndCondition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userRole = prefs.getString('role');
    if(userRole == 'User') {
      setState(() {
        role = userRole;
        _children = [
          RoleHome(),
          OrderHistoryPage(),
          UploadPrescription(),
          TrackOrder()
        ];
      });
    } else {
      setState(() {
        role = userRole;
        _children = [
          RoleHome(),
          OrderHistoryPage(),
          TrackOrder()
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _backPressed(),
    child: Scaffold(
      key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: CommonHeader(home: (){setState(() {
          _currentIndex = 0;
        });}, sidemenu: (){
          _scaffoldKey.currentState.openDrawer();
        })),
      drawer: SideDrawer(),
        body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_sharp),
            title: Text('Orders'),
          ),
          if(role != null && role == 'User')
          new BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            title: Text('Prescription'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            title: Text('Track Order'),
          ),
        ],
      ),
    )
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _backPressed() async {
    if (_currentIndex == 0) {
      if(Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}

class SideDrawer extends StatefulWidget {
  SideDrawer({Key key}) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
String name= "";
  void initState() {
    super.initState();
    getUser();
  }
getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    name = prefs.get('chemist_name');
  });
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              child: Center(
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Image.asset('graphics/logo2.png', height: 60),
                          SizedBox(height: 10,),
                          Container(
                              child: Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          )
                        ],
                      )
                  )
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Offer'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shop By Category'),
            onTap: () {Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MainCategories(),
              ),
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Order'),
            onTap: () {Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SideOrder(),
              ),
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Delivery Address'),
            onTap: () {Navigator.of(context).pop();
            Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => AddressList(),
            ),
            );
            },
          ),

          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Contact Us'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('About Us'),
            onTap: () {Navigator.of(context).pop();Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AboutUs(),
              ),
            );},
          ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Wallet'),
          //   onTap: () {Navigator.of(context).pop();
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => WalletPage(),
          //     ),
          //   );},
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              authBloc.closeSession();
              Navigator.of(context).pop();Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => KitchenPage(),
              ),
            );},
          ),
        ],
      ),
    );
  }
}