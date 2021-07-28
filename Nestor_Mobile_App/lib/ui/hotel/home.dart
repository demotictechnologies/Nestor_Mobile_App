import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/hotel_text_field.dart';
import 'package:nestore/ui/hotel/specialOffers.dart';
import 'package:nestore/ui/hotel/uploadPrescription.dart';
import 'package:nestore/ui/offers/offers.dart';
import 'package:nestore/ui/product/products.dart';
import 'package:nestore/ui/user/AccountPage.dart';
import 'package:nestore/ui/user/wallet.dart';

class HotelHome extends StatefulWidget {
  HotelHome({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<HotelHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  color: AppColors.primaryColor,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                'NESTOR',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                child: Padding(
                                    padding: EdgeInsets.only(),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => OffersPage(),
                                          ),
                                        );
                                      },
                                      child: Icon(Icons.local_offer_rounded,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                child: Padding(
                                    padding: EdgeInsets.only(),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CartPage(),
                                            ),
                                          );
                                        },
                                        child: Icon(Icons.shopping_cart_rounded,
                                            color: Colors.white))),
                              ),
                            )
                          ],
                        ),
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: HotelTextField(
                            placeholderText:
                                'Search for medicine & wellness products...',
                          ),
                        ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Column(
              children: [
                Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 10, bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Container(
                                width: double.infinity,
                                child: Wrap(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Colors.black38),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text('Deliver to 40001',
                                          style:
                                              TextStyle(color: Colors.black38)),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )),
                AllCuisines(),
                ByTypeOfFood(),
                AllRestaurants(),
                AllRestaurants2()
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('Home', style: TextStyle(fontSize: 12)),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.move_to_inbox_sharp),
            title: Text('Order', style: TextStyle(fontSize: 12)),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            title: Text('Subscription', style: TextStyle(fontSize: 12)),
          ),
          new BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ),
                  );
                },
                child: Icon(Icons.account_circle)),
            title: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  ),
                );
              },
              child: Text(
                'Account',
                style: TextStyle(fontSize: 12),
              ),
            )
          ),
          new BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WalletPage(),
                  ),
                );
              },
              child: Icon(Icons.account_balance_wallet),
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WalletPage(),
                  ),
                );
              },
              child: Text('Wallet', style: TextStyle(fontSize: 12)),
            )
          ),
        ],
      ),
    );
  }
}

class SpecialOffers extends StatefulWidget {
  SpecialOffers({Key key}) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HotelSpecialOffers(),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Special Offers',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                                ),
                              ),
                            )),
                        Container(
                            color: Colors.white,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            height: (MediaQuery.of(context).size.height * 0.55),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                              ],
                            ))
                      ],
                    )),
              ),
            )));
  }
}

class AllCuisines extends StatefulWidget {
  AllCuisines({Key key}) : super(key: key);

  @override
  _AllCuisinesState createState() => _AllCuisinesState();
}

class _AllCuisinesState extends State<AllCuisines> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwsxCX78Kjg9lBJqTzDeNdWncmM3jO-p8DXCrkYEFMVrv7qGIB7_zd5zrMr_yqjonXhqE&usqp=CAU"),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                )),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                            )),
                                      ),
                                      Positioned(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                child: Text('Wellness',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://5.imimg.com/data5/XW/AQ/GLADMIN-17716306/doctor-consultation-500x500.jpg"),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                )),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                            )),
                                      ),
                                      Positioned(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                child: Text('Consult a doctor',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://ddrcsrl.com/images/sliders/s10.jpg"),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                )),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                            )),
                                      ),
                                      Positioned(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                child: Text('Lab Tests',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )),
              ),
            )));
  }
}

class ByTypeOfFood extends StatefulWidget {
  ByTypeOfFood({Key key}) : super(key: key);

  @override
  _ByTypeOfFoodState createState() => _ByTypeOfFoodState();
}

class _ByTypeOfFoodState extends State<ByTypeOfFood> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 0),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                'Explore',
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                'NESTOR',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => UploadPrescription(),
                                            ),
                                          );
                                        },
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: Colors.white),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20, bottom: 20, left: 5),
                                                child: Text('Upload Prescription',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 18))),
                                          ))
                                    )),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Colors.white),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20, bottom: 20, left: 5),
                                              child: Text('Generic Medicines',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18))),
                                        ))),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 30),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                  'Find a Nestore Store near you',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18)))),
                                      Expanded(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.grey,
                                                      size: 32))))
                                    ],
                                  )),
                            ))
                      ],
                    )),
              ),
            )));
  }
}

class AllRestaurants extends StatefulWidget {
  AllRestaurants({Key key}) : super(key: key);

  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'TRENDING',
                        style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'TODAY',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )),
                Container(
                    color: Colors.grey[100],
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    height: (MediaQuery.of(context).size.height * 0.2),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.18,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpk7AD0mkYd9fJ-8sIULP3VL-P4D6xlJaMrQ&usqp=CAU"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              )),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuUnJbgqHo6h1x-0VcGISrsOqmar4s8RqR7hdyP3H87TTND23L4H7SjHpy1UFw_vs2NM&usqp=CAU"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              )),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ))),
                      ],
                    ))
              ],
            )));
  }
}

class AllRestaurants2 extends StatefulWidget {
  AllRestaurants2({Key key}) : super(key: key);

  @override
  _AllRestaurantsState2 createState() => _AllRestaurantsState2();
}

class _AllRestaurantsState2 extends State<AllRestaurants2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'SUB',
                        style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )),
                Container(
                    color: Colors.grey[100],
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    height: (MediaQuery.of(context).size.height * 0.55),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.18,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.4,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpk7AD0mkYd9fJ-8sIULP3VL-P4D6xlJaMrQ&usqp=CAU"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.18,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.4,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuUnJbgqHo6h1x-0VcGISrsOqmar4s8RqR7hdyP3H87TTND23L4H7SjHpy1UFw_vs2NM&usqp=CAU"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.18,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.4,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                      ],
                    ))
              ],
            )));
  }
}

class PopularThisWeek extends StatefulWidget {
  PopularThisWeek({Key key}) : super(key: key);

  @override
  _PopularThisWeekState createState() => _PopularThisWeekState();
}

class _PopularThisWeekState extends State<PopularThisWeek> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 5),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                'Popular This Week',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                              ),
                            )),
                        Container(
                            color: Colors.white,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            height: (MediaQuery.of(context).size.height * 0.55),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                      12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                              ],
                            ))
                      ],
                    )),
              ),
            )));
  }
}
